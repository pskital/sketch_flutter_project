import 'package:flutter/material.dart';

@immutable
class Translations {
  const Translations._();

  static Map<String, String> translations = {};

  static String tr(String key) {
    final translation = translations[key];
    if (translation == null) {
      return key;
    }
    return translation;
  }
}
