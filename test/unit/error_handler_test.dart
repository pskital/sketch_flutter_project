import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sketch_flutter_project/core/errors/error_handler.dart';
import 'package:sketch_flutter_project/core/translations/app_translations.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';

class ErrorHandlerTest with ErrorHandler {}

void main() {
  final ErrorHandlerTest errorHandler = ErrorHandlerTest();

  test('test handle internal login error', () {
    final ArgumentError argumentError = ArgumentError();
    final String error =
        errorHandler.handleError(UserLoginErrorState(argumentError));
    expect(error, translations.errors.internalError);
  });

  test('test handle server error', () {
    final DioError dioError = DioError(
      type: DioErrorType.response,
      requestOptions: RequestOptions(path: ''),
      response: Response<String>(
        statusCode: HttpStatus.badRequest,
        requestOptions: RequestOptions(path: ''),
        data: 'Nie prawidlowe dane logowania',
      ),
    );

    final String error =
        errorHandler.handleError(UserLoginErrorState(dioError));
    expect(error, 'Nie prawidlowe dane logowania');
  });

  test('test handle server 403 status', () {
    final DioError dioError = DioError(
      type: DioErrorType.response,
      requestOptions: RequestOptions(path: ''),
      response: Response<ResponseType>(
        requestOptions: RequestOptions(path: ''),
        statusCode: HttpStatus.forbidden,
      ),
    );
    final String error =
        errorHandler.handleError(UserLoginErrorState(dioError));
    expect(error, translations.errors.forbidden);
  });
}
