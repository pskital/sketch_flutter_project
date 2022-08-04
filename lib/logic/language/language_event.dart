import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';

abstract class LanguageEvent {}

@immutable
class SetLanguageEvent implements LanguageEvent {
  final LangType? langType;

  const SetLanguageEvent({required this.langType});
}

@immutable
class SetSystemLocaleEvent implements LanguageEvent {
  final List<Locale>? locales;

  const SetSystemLocaleEvent({required this.locales});
}
