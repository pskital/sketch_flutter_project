import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/logic/redux/password_recovery/password_recovery_state.dart';

@immutable
class AppSate {
  //final RegisterUserState registerState;
  //final LoginUserState loginState;
  //itd...

  const AppSate({
    required this.passwordRecoveryState,
  });

  final PasswordRecoveryState passwordRecoveryState;

  AppSate copy({
    PasswordRecoveryState? passwordRecoveryState,
  }) {
    return AppSate(
      passwordRecoveryState:
          passwordRecoveryState ?? this.passwordRecoveryState,
    );
  }
}
