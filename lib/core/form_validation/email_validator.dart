import 'package:sketch_flutter_project/core/extensions/email_validator_extension.dart';

mixin EmailValidator {
  String? Function(String?) emailValidator = (String? value) {
    if (value == null || !value.isValidEmail()) {
      return 'Incorrect email';
    }
    return null;
  };
}
