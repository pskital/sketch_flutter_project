import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/exceptions/error_handler.dart';
import 'package:sketch_flutter_project/core/exceptions/error_state.dart';
import 'package:sketch_flutter_project/data/models/response_login_user_model.dart';

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
  const UserLoginInProgressState();
}

@immutable
class UserLoginSuccessState extends UserLoginState {
  final ResponseLoginUserModel responseLoginUserModel;

  const UserLoginSuccessState(this.responseLoginUserModel);

  @override
  List<Object?> get props => [responseLoginUserModel.token];
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
  Object getError() {
    return error;
  }
}
