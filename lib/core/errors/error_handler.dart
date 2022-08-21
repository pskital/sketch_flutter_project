import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/errors/error_state.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';

mixin ErrorHandler {
  String handleError(ErrorState errorState) {
    final Object? error = errorState.getError();
    debugPrint(error.toString());

    switch (error.runtimeType) {
      case DioError:
        return handleDioError(error! as DioError);
      default:
        return handleInternalError(errorState);
    }
  }

  String handleDioError(DioError error) {
    final Response<dynamic>? response = error.response;
    if (response != null) {
      if (response.statusCode == HttpStatus.forbidden) {
        return forbiddenMessage();
      }

      return response.data;
    } else {
      return 'unknown error';
    }
  }

  String handleInternalError(ErrorState errorState) {
    switch (errorState.runtimeType) {
      case UserLoginErrorState:
        return 'login error';
      default:
        return 'unknown error';
    }
  }

  String forbiddenMessage() {
    return 'Brak dostępu';
  }
}
