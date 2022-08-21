import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';

abstract class LanguageRepository {
  late LangType langType;

  Future<void> setLanguage(LangType langType);

  Future<void> setSystemLocale(List<Locale>? locales);
}
