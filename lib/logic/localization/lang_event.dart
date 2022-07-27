import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';

abstract class LangEvent {}

@immutable
class SetLanguageEvent implements LangEvent {
  final LangType? langType;

  const SetLanguageEvent({required this.langType});
}

@immutable
class SetSystemLocaleEvent implements LangEvent {
  final List<Locale>? locales;

  const SetSystemLocaleEvent({required this.locales});
}
