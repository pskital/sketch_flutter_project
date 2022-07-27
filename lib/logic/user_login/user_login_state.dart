import 'package:equatable/equatable.dart';
import 'package:sketch_flutter_project/core/extensions/string_translate_extension.dart';
import 'package:sketch_flutter_project/data/models/response_login_user_model.dart';

abstract class UserLoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserLoginInProgressState extends UserLoginState {
  UserLoginInProgressState();

  @override
  List<Object?> get props => [];
}

class UserLoginSuccessState extends UserLoginState {
  final ResponseLoginUserModel responseLoginUserModel;

  UserLoginSuccessState(this.responseLoginUserModel);

  @override
  List<Object?> get props => [responseLoginUserModel.token];
}

class UserLoginErrorState extends UserLoginState {
  final String? error;

  String get errorMessage => error ?? 'loginError'.tr();

  UserLoginErrorState(this.error);

  @override
  List<Object?> get props => [];
}
