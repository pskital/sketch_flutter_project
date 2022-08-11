import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/exceptions/error_handler.dart';
import 'package:sketch_flutter_project/core/exceptions/error_state.dart';
import 'package:sketch_flutter_project/core/utils/keyboard_utils.dart';

@immutable
abstract class UserLoginState extends Equatable {
  const UserLoginState();

  @override
  List<Object?> get props => [];
}

@immutable
class UserLoginIdleState extends UserLoginState {
  const UserLoginIdleState();
}

@immutable
class UserLoginInProgressState extends UserLoginState {
  UserLoginInProgressState() {
    KeyboardUtils.hideKeyboard();
  }
}

@immutable
class UserLoginSuccessState extends UserLoginState {
  const UserLoginSuccessState();
}

@immutable
class UserLoginErrorState extends UserLoginState
    with ErrorHandler
    implements ErrorState {
  final Object error;

  const UserLoginErrorState(this.error);

  @override
  String getErrorMessage() {
    return handleError(this);
  }

  @override
  Object? getError() {
    return error;
  }
}
