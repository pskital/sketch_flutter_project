import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';

@immutable
abstract class LangState extends Equatable {
  final LangType langType;

  const LangState(this.langType);

  @override
  List<Object?> get props => [];
}

@immutable
class SetLangState extends LangState {
  const SetLangState(LangType langType) : super(langType);

  @override
  List<Object?> get props => [langType];
}

class SetSystemLocalesLangState extends LangState {
  final UniqueKey uniqueKey = UniqueKey();

  SetSystemLocalesLangState(LangType langType) : super(langType);

  @override
  List<Object?> get props => [langType, uniqueKey];
}
