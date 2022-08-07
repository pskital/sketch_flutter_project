import 'package:flutter_test/flutter_test.dart';
import 'package:sketch_flutter_project/core/validation/user_login_form_validator.dart';

void main() {
  UserLoginFormValidator formValidator = UserLoginFormValidator();

  test('test empty email returns error', () {
    final result = formValidator.emailValidator('');
    expect(result, 'incorrectEmail');
  });

  test('test null email returns error', () {
    final result = formValidator.emailValidator(null);
    expect(result, 'incorrectEmail');
  });

  test('test incorrect email format returns error', () {
    var result = formValidator.emailValidator('email@');
    expect(result, 'incorrectEmail');
    result = formValidator.emailValidator('email@wp');
    expect(result, 'incorrectEmail');
    result = formValidator.emailValidator('email@wp.');
    expect(result, 'incorrectEmail');
    result = formValidator.emailValidator('email@wp.p');
    expect(result, 'incorrectEmail');
    result = formValidator.emailValidator('email');
    expect(result, 'incorrectEmail');
  });

  test('test correct email returns null', () {
    final result = formValidator.emailValidator('email@gmail.com');
    expect(result, null);
  });

  test('test null password returns error', () {
    final result = formValidator.passwordValidator(null);
    expect(result, 'incorrectPassword');
  });

  test('test empty password returns error', () {
    final result = formValidator.passwordValidator('');
    expect(result, 'incorrectPasswordLength');
  });

  test('test incorrect password length returns error', () {
    final result = formValidator.passwordValidator('12345');
    expect(result, 'incorrectPasswordLength');
  });

  test('test correct password returns null', () {
    final result = formValidator.passwordValidator('123456');
    expect(result, null);
  });
}
