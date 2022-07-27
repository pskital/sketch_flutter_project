import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/extensions/string_translate_extension.dart';
import 'package:sketch_flutter_project/data/models/response_login_user_model.dart';

@immutable
abstract class UserLoginState extends Equatable {
  const UserLoginState();

  @override
  List<Object?> get props => [];
}

class UserLoginIdleState extends UserLoginState {}

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
class UserLoginErrorState extends UserLoginState {
  final String? error;

  String get errorMessage => error ?? 'loginError'.tr();

  const UserLoginErrorState(this.error);

  @override
  List<Object?> get props => [errorMessage];
}
