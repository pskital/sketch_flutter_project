import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sketch_flutter_project/core/exceptions/error_handler.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';

class ErrorHandlerTest with ErrorHandler {}

class MockDioError extends Mock implements DioError {}

void main() {
  ErrorHandler formValidator = ErrorHandlerTest();

  test('test handle internal login error', () {
    ArgumentError argumentError = ArgumentError();
    var error = formValidator.handleError(UserLoginErrorState(argumentError));
    expect(error, 'loginError');
  });

  test('test handle server error', () {
    MockDioError mockDioError = MockDioError();
    when(() => mockDioError.response).thenReturn(Response(
        requestOptions: RequestOptions(path: ''),
        data: 'Nie prawidlowe dane logowania'));

    var error = formValidator.handleError(UserLoginErrorState(mockDioError));
    expect(error, 'Nie prawidlowe dane logowania');
  });
}
