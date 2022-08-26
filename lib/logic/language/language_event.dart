import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';

abstract class LanguageEvent {}

@immutable
class SetLanguageEvent implements LanguageEvent {
  const SetLanguageEvent({required this.langType});

  final LanguageType? langType;
}

@immutable
class UpdateSystemLocaleEvent implements LanguageEvent {
  const UpdateSystemLocaleEvent({required this.locales});

  final List<Locale>? locales;
}
