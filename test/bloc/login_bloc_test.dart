import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sketch_flutter_project/data/models/response_login_user_model.dart';
import 'package:sketch_flutter_project/data/repositories/token_repository.dart';
import 'package:sketch_flutter_project/data/rest_api/user_rest_api.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_bloc.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_event.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_form_validator.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';

class MockLoginFormValidator extends Mock implements UserLoginFormValidator {}

class MockTokenRepository extends Mock implements TokenRepository {}

class MockUserRestApi extends Mock implements UserRestApi {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late MockLoginFormValidator mockLoginFormValidator;
  late MockTokenRepository mockTokenRepository;
  late MockUserRestApi mockUserRestApi;
  late LoginUserBloc loginUserBloc;

  setUp(() {
    mockLoginFormValidator = MockLoginFormValidator();
    mockTokenRepository = MockTokenRepository();
    mockUserRestApi = MockUserRestApi();

    loginUserBloc = LoginUserBloc.test(
      mockLoginFormValidator,
      mockTokenRepository,
      mockUserRestApi,
    );
  });

  blocTest<LoginUserBloc, UserLoginState?>('test incorrect login credentials',
      setUp: () {
        when(() => mockLoginFormValidator.isLoginFormValid()).thenReturn(false);
      },
      wait: const Duration(milliseconds: 700),
      build: () => loginUserBloc,
      act: (bloc) {
        bloc.add(const UserLoginEvent());
      },
      expect: () => [
            const UserLoginInProgressState(),
            const UserLoginErrorState('invalidCredentials'),
          ]);

  var responseLoginUserModel = ResponseLoginUserModel('token');
  blocTest<LoginUserBloc, UserLoginState?>('test login success request',
      setUp: () {
        when(() => mockLoginFormValidator.isLoginFormValid()).thenReturn(true);
        when(() => mockUserRestApi.loginUser('test@gmail.com', 'test123', true))
            .thenAnswer((_) async => Future.value(responseLoginUserModel));
        when(() => mockTokenRepository.saveToken(responseLoginUserModel.token))
            .thenAnswer((_) async => Future.value());
      },
      wait: const Duration(milliseconds: 700),
      build: () => loginUserBloc,
      act: (bloc) {
        bloc.add(const UserLoginEvent());
      },
      expect: () => [
            const UserLoginInProgressState(),
            const UserLoginSuccessState(),
          ]);
}
