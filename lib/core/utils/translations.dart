import 'package:flutter/material.dart';

@immutable
class Translations {
  const Translations._();

  static Map<String, String> translations = <String, String>{};

  static String tr(String key) {
    final String? translation = translations[key];
    if (translation == null) {
      return key;
    }
    return translation;
  }
}
