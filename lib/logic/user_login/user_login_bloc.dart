import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/exceptions/exceptions_handler.dart';
import 'package:sketch_flutter_project/core/utils/keyboard_utils.dart';
import 'package:sketch_flutter_project/data/repositories/token_repository.dart';
import 'package:sketch_flutter_project/data/rest_api/user_rest_api.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_event.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';

class LoginUserBloc extends Bloc<UserLoginEvent, UserLoginState?>
    with ExceptionsHandler {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final emailTextController = TextEditingController(
    text: kReleaseMode ? '' : 'test@gmail.com',
  );
  final passwordTextController = TextEditingController(
    text: kReleaseMode ? '' : 'test123',
  );

  final TokenRepository tokenRepository;
  final UserRestApi userRestApi;

  LoginUserBloc({
    required this.tokenRepository,
    required this.userRestApi,
  }) : super(null) {
    on<UserLoginEvent>(_onUserLoginEvent);
  }

  Future<void> _onUserLoginEvent(
    event,
    emit,
  ) async {
    emit(UserLoginInProgressState());

    if (!_isLoginFormValid()) {
      emit(null);
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
      );

      await tokenRepository.saveToken(responseLoginUserModel.token);
      emit(UserLoginSuccessState(responseLoginUserModel));
    } catch (error) {
      emit(UserLoginErrorState(handleException(error)));
    }
  }

  bool _isLoginFormValid() {
    return loginFormKey.currentState?.validate() ?? false;
  }
}
