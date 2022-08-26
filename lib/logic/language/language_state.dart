import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';

@immutable
abstract class LanguageState extends Equatable {
  const LanguageState(this.langType);

  final LanguageType langType;

  @override
  List<Object?> get props => <Object?>[];
}

@immutable
class SetLanguageState extends LanguageState {
  const SetLanguageState(LanguageType langType) : super(langType);

  @override
  List<Object?> get props => <Object?>[langType];
}

class UpdateSystemLocalesState extends LanguageState {
  UpdateSystemLocalesState(LanguageType langType) : super(langType);
  final UniqueKey uniqueKey = UniqueKey();

  @override
  List<Object?> get props => <Object?>[langType, uniqueKey];
}
