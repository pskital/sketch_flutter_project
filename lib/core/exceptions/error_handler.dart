import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/exceptions/error_state.dart';
import 'package:sketch_flutter_project/core/extensions/translation_extension.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';

mixin ErrorHandler {
  String handleError(ErrorState errorState) {
    Object? error = errorState.getError();
    debugPrint(error.toString());

    if (error is DioError) {
      final response = error.response;
      if (response != null) {
        //TODO handle server error message
        return response.data;
      }
    }

    switch (errorState.runtimeType) {
      case UserLoginErrorState:
        return 'loginError'.tr();
    }

    return 'unknown';
  }
}
