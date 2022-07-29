import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';

@immutable
abstract class LanguageState extends Equatable {
  final LangType langType;

  const LanguageState(this.langType);

  @override
  List<Object?> get props => [];
}

@immutable
class SetLanguageState extends LanguageState {
  const SetLanguageState(LangType langType) : super(langType);

  @override
  List<Object?> get props => [langType];
}

class SetSystemLocalesState extends LanguageState {
  final UniqueKey uniqueKey = UniqueKey();

  SetSystemLocalesState(LangType langType) : super(langType);

  @override
  List<Object?> get props => [langType, uniqueKey];
}
