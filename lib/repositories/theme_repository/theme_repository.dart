import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/theme_type.dart';

abstract class ThemeRepository {
  ThemeType get themeType;

  Future<void> initTheme();

  Future<void> setTheme(ThemeType theme);

  ThemeMode getThemeMode();

  ThemeData getThemeData();
}
