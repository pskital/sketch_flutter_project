import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/core/extensions/translation_extension.dart';
import 'package:sketch_flutter_project/data/repositories/token_repository/token_repository.dart';
import 'package:sketch_flutter_project/data/rest_api/user_rest_api.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_event.dart';
import 'package:sketch_flutter_project/core/validation/user_login_form_validator.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';

@injectable
class LoginUserBloc extends Bloc<UserLoginEvent, UserLoginState> {
  /*
  * Bloc jest tworzony tylko do ekranu lub funkcjonalnosci
  * */

  ///Do bloc'a mozna przenosic niektore pola z widgetow
  ///np. [emailTextController]
  ///np. [loginFormValidator]

  final emailTextController = TextEditingController(
    text: kReleaseMode ? '' : 'test@gmail.com',
  );
  final passwordTextController = TextEditingController(
    text: kReleaseMode ? '' : 'test123',
  );

  final UserLoginFormValidator loginFormValidator;
  final TokenRepository tokenRepository;
  final UserRestApi userRestApi;

  /*
  * Injectowanie zaleznosci w konstruktorze ulatwia mockowanie w testach
  * */
  LoginUserBloc({
    required this.loginFormValidator,
    required this.tokenRepository,
    required this.userRestApi,
  }) : super(/*init state of bloc*/ const UserLoginIdleState()) {
    /*oczekiwanie na event >UserLoginEvent< */
    on<UserLoginEvent>(
      _onUserLoginEvent,
      /*
      * Event transformers << cool
      * https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/bloc_concurrency_diagram.png
      * */

      /// Process only one event and ignore (drop) any new events
      transformer: droppable(),
    );
  }

  /*
  * Obsługa eventu logowania
  * */
  Future<void> _onUserLoginEvent(
    event,
    emit,
  ) async {
    ///rozpoczecie logowania
    /*np. pokazujemy loader*/
    emit(UserLoginInProgressState());

    ///walidacja formularza
    if (!loginFormValidator.isFormValid()) {
      //translacje do przerobienia na i69n
      emit(UserLoginErrorState('invalidCredentials'.tr()));
      return;
    }

    final login = emailTextController.text;
    final password = passwordTextController.text;

    try {
      ///request do api (proponiuje retrofit + dio)
      await Future.delayed(const Duration(milliseconds: 500));
      final responseLoginUserModel = await userRestApi.loginUser(
        login,
        password,
        true,
      );

      ///zapis np. tokena
      await tokenRepository.saveToken(responseLoginUserModel.token);

      ///jesli wszystko ok >> emitujemy success
      emit(const UserLoginSuccessState());
    } catch (error) {
      /*
      * Obsługa błędów jest w jednym miejscu (UserLoginErrorState with ErrorState)
      * */

      ///jesli blad emitujemy error
      emit(UserLoginErrorState(error));
    } finally {
      ///opcjonalnie resetujemy state
      emit(const UserLoginIdleState());
    }
  }

  ///wywolywane automatycznie przy >> pop page
  @override
  Future<void> close() {
    return super.close();
  }
}
