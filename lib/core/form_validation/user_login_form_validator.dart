import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/core/form_validation/email_validator.dart';

@injectable
class UserLoginFormValidator with EmailValidator {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? Function(String?) passwordValidator = (String? value) {
    if (value == null) {
      return 'Incorrect password';
    }

    if (value.length < 6) {
      return 'Incorrect password length';
    }
    return null;
  };

  bool isFormValid() {
    return formKey.currentState?.validate() ?? false;
  }
}
