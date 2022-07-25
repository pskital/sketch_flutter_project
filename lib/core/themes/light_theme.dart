import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/themes/app_theme.dart';
import 'package:sketch_flutter_project/core/themes/base_theme.dart';

class LightTheme implements AppTheme {
  @override
  ThemeData get() {
    return ThemeData.light().copyWith(appBarTheme: BaseTheme.appBarTheme);
  }
}
