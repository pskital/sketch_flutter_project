import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/core/extensions/translation_extension.dart';
import 'package:sketch_flutter_project/core/validation/email_validator.dart';

@injectable
class UserLoginFormValidator with EmailValidator {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? Function(String?) passwordValidator = (value) {
    if (value == null) {
      return 'incorrectPassword'.tr();
    }

    if (value.length < 6) {
      return 'incorrectPasswordLength'.tr();
    }
    return null;
  };

  bool isFormValid() {
    return formKey.currentState?.validate() ?? false;
  }
}
