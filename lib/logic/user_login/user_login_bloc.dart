import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/extensions/translation_extension.dart';
import 'package:sketch_flutter_project/core/utils/keyboard_utils.dart';
import 'package:sketch_flutter_project/data/providers/dio_provider.dart';
import 'package:sketch_flutter_project/data/providers/storage_provider.dart';
import 'package:sketch_flutter_project/data/repositories/token_repository.dart';
import 'package:sketch_flutter_project/data/rest_api/user_rest_api.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_event.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_form_validator.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';

class LoginUserBloc extends Bloc<UserLoginEvent, UserLoginState> {
  final emailTextController = TextEditingController(
    text: kReleaseMode ? '' : 'test@gmail.com',
  );
  final passwordTextController = TextEditingController(
    text: kReleaseMode ? '' : 'test123',
  );

  final UserLoginFormValidator loginFormValidator;
  final TokenRepository tokenRepository;
  final UserRestApi userRestApi;

  factory LoginUserBloc() {
    var localStorage = StorageProvider.getLocalStorage();
    var tokenRepository = TokenRepository(localStorage: localStorage);
    var dio = DioProvider(tokenRepository: tokenRepository).getDio();
    return LoginUserBloc._(
      UserLoginFormValidator(),
      tokenRepository,
      UserRestApi(dio),
    );
  }

  LoginUserBloc._(
    this.loginFormValidator,
    this.tokenRepository,
    this.userRestApi,
  ) : super(const UserLoginIdleState()) {
    on<UserLoginEvent>(
      _onUserLoginEvent,
      transformer: droppable(),
    );
  }

  LoginUserBloc.test(
    this.loginFormValidator,
    this.tokenRepository,
    this.userRestApi,
  ) : super(const UserLoginIdleState()) {
    on<UserLoginEvent>(
      _onUserLoginEvent,
      transformer: droppable(),
    );
  }

  Future<void> _onUserLoginEvent(
    event,
    emit,
  ) async {
    emit(const UserLoginInProgressState());

    if (!loginFormValidator.isLoginFormValid()) {
      emit(UserLoginErrorState('invalidCredentials'.tr()));
      return;
    }

    KeyboardUtils.hideKeyboard();

    var login = emailTextController.text;
    var password = passwordTextController.text;

    try {
      await Future.delayed(const Duration(milliseconds: 500));
      var responseLoginUserModel = await userRestApi.loginUser(
        login,
        password,
        true,
      );

      await tokenRepository.saveToken(responseLoginUserModel.token);
      emit(const UserLoginSuccessState());
    } catch (error) {
      //TODO uncomment and remove current
      //emit(UserLoginErrorState(error));
      emit(const UserLoginSuccessState());
    }
  }
}
