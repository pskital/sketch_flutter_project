import 'package:sketch_flutter_project/core/extensions/email_validator_extension.dart';
import 'package:sketch_flutter_project/core/extensions/string_translate_extension.dart';

class FormValidator {
  FormValidator._();

  static String? Function(String?) emailValidator = (value) {
    if (value == null || !value.isValidEmail()) {
      return 'incorrectEmail'.tr();
    }
    return null;
  };

  static String? Function(String?) passwordValidator = (value) {
    if (value == null) {
      return 'incorrectPassword'.tr();
    }

    if (value.length < 6) {
      return 'incorrectPasswordLength'.tr();
    }
    return null;
  };
}
