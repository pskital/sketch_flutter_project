import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/validation/email_validator.dart';

class PasswordRecoveryValidator with EmailValidator {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isFormValid() {
    return formKey.currentState?.validate() ?? false;
  }
}
