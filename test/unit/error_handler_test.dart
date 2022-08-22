import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sketch_flutter_project/core/errors/error_handler.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';

class ErrorHandlerTest with ErrorHandler {}

void main() {
  final ErrorHandlerTest errorHandler = ErrorHandlerTest();

  test('test handle internal login error', () {
    final ArgumentError argumentError = ArgumentError();
    final String error =
        errorHandler.handleError(UserLoginErrorState(argumentError));
    expect(error, 'loginError');
  });

  test('test handle server error', () {
    final DioError dioError = DioError(
      requestOptions: RequestOptions(path: ''),
    );
    dioError.response = Response<String>(
      requestOptions: RequestOptions(path: ''),
      data: 'Nie prawidlowe dane logowania',
    );

    final String error =
        errorHandler.handleError(UserLoginErrorState(dioError));
    expect(error, 'Nie prawidlowe dane logowania');
  });

  test('test handle server 403 status', () {
    final DioError dioError = DioError(
      requestOptions: RequestOptions(path: ''),
    );

    dioError.response = Response<ResponseType>(
      requestOptions: RequestOptions(path: ''),
      statusCode: HttpStatus.forbidden,
    );

    final String error =
        errorHandler.handleError(UserLoginErrorState(dioError));
    expect(error, 'No access');
  });
}
