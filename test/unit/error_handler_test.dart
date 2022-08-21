import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sketch_flutter_project/core/errors/error_handler.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';

class ErrorHandlerTest with ErrorHandler {
  @override
  String forbiddenMessage() {
    return 'No access';
  }
}

class MockDioError extends Mock implements DioError {}

void main() {
  final ErrorHandlerTest errorHandler = ErrorHandlerTest();

  test('test handle internal login error', () {
    final ArgumentError argumentError = ArgumentError();
    final String error =
        errorHandler.handleError(UserLoginErrorState(argumentError));
    expect(error, 'loginError');
  });

  test('test handle server error', () {
    final MockDioError mockDioError = MockDioError();
    when(() => mockDioError.response).thenReturn(
      Response<dynamic>(
        requestOptions: RequestOptions(path: ''),
        data: 'Nie prawidlowe dane logowania',
      ),
    );

    final String error =
        errorHandler.handleError(UserLoginErrorState(mockDioError));
    expect(error, 'Nie prawidlowe dane logowania');
  });

  test('test handle server 403 status', () {
    final MockDioError mockDioError = MockDioError();
    final Response<ResponseType> response = Response<ResponseType>(
      requestOptions: RequestOptions(path: ''),
    );
    response.statusCode = HttpStatus.forbidden;
    when(() => mockDioError.response).thenReturn(response);

    final String error =
        errorHandler.handleError(UserLoginErrorState(mockDioError));
    expect(error, 'No access');
  });
}
