import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/theme_type.dart';

@immutable
class ChangeThemeAction extends Equatable {
  const ChangeThemeAction({required this.themeType});

  final ThemeType? themeType;

  @override
  List<Object?> get props => <Object?>[themeType];
}
