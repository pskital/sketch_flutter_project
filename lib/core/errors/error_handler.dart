import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/errors/error_state.dart';
import 'package:sketch_flutter_project/core/extensions/translation_extension.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';

mixin ErrorHandler {
  String handleError(ErrorState errorState) {
    final Object? error = errorState.getError();
    debugPrint(error.toString());

    if (error is DioError) {
      final Response<dynamic>? response = error.response;
      if (response != null) {
        if (response.statusCode == HttpStatus.forbidden) {
          return forbiddenMessage();
        }

        return response.data;
      }
    }

    switch (errorState.runtimeType) {
      case UserLoginErrorState:
        return 'loginError'.tr();
    }

    return 'unknown';
  }

  String forbiddenMessage() {
    return 'Brak dostępu';
  }
}
