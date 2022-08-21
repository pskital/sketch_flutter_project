import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';

abstract class LanguageEvent {}

@immutable
class SetLanguageEvent implements LanguageEvent {
  const SetLanguageEvent({required this.langType});

  final LangType? langType;
}

@immutable
class SetSystemLocaleEvent implements LanguageEvent {
  const SetSystemLocaleEvent({required this.locales});

  final List<Locale>? locales;
}
