import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:sketch_flutter_project/core/enums/password_recovery_status.dart';
import 'package:sketch_flutter_project/data/dependencies/configure_dependencies.dart';
import 'package:sketch_flutter_project/data/rest_api/user_rest_api.dart';
import 'package:sketch_flutter_project/logic/redux/app_state.dart';

class PasswordRecoveryAction extends ReduxAction<AppSate> {
  final String email;

  PasswordRecoveryAction(this.email);

  @override
  void before() => dispatch(PasswordRecoveryInProgressAction());

  @override
  Future<AppSate> reduce() async {
    var passwordRecoveryState = state.passwordRecoveryState;
    try {
      await Future.delayed(const Duration(milliseconds: 3000));
      var userRestApi = serviceLocator.get<UserRestApi>();
      await userRestApi.recoveryPassword(email);
    } catch (error) {
      return state.copy(
        passwordRecoveryState: passwordRecoveryState.copy(
          status: PasswordRecoveryStatus.error,
          error: error,
        ),
      );
    }
    return state.copy(
      passwordRecoveryState: passwordRecoveryState.copy(
        status: PasswordRecoveryStatus.success,
      ),
    );
  }
}

class PasswordRecoveryInProgressAction extends ReduxAction<AppSate> {
  @override
  AppSate reduce() {
    var passwordRecoveryState = state.passwordRecoveryState;
    return state.copy(
      passwordRecoveryState: passwordRecoveryState.copy(
        status: PasswordRecoveryStatus.inProgress,
      ),
    );
  }
}
