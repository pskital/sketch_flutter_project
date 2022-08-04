import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';

abstract class LanguageRepository {
  late LangType langType;

  setLanguage(LangType langType);

  setSystemLocale(List<Locale>? locales);
}
