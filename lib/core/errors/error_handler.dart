import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/errors/error_state.dart';
import 'package:sketch_flutter_project/core/translations/app_translations.dart';

mixin ErrorHandler {
  String handleError(ErrorState errorState) {
    final Object? error = errorState.getError();
    debugPrint(error.toString());

    switch (error?.runtimeType) {
      case DioError:
        return handleDioError(error! as DioError);
      default:
        return translations.errors.internalError;
    }
  }

  String handleDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return translations.errors.connectionTimeout;
      case DioErrorType.response:
        return handleServerError(dioError);
      case DioErrorType.cancel:
      case DioErrorType.other:
        return translations.errors.connectionError;
    }
  }

  String handleServerError(DioError dioError) {
    final Response<dynamic>? response = dioError.response;
    switch (response?.statusCode) {
      case HttpStatus.unauthorized:
        return translations.errors.unauthorized;
      case HttpStatus.forbidden:
        return translations.errors.forbidden;
      case HttpStatus.internalServerError:
        return translations.errors.serverInternalError;
      case HttpStatus.badRequest:
        // TODO(przemek): parse server error
        return response?.data ?? translations.errors.connectionError;
      default:
        return translations.errors.connectionError;
    }
  }
}
