import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/fonts/font_family.dart';
import 'package:sketch_flutter_project/core/styles/text_styles.dart';

abstract class AppTheme {
  ThemeData get() {
    final ThemeData themeData = createTheme();
    return themeData.copyWith(
      textTheme: themeData.textTheme.apply(
        fontFamily: FontFamily.audiTypeNormal,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(50, 50),
          textStyle: TextStyles.buttonTextStyle(),
        ),
      ),
      appBarTheme: themeData.appBarTheme.copyWith(
        centerTitle: false,
        titleTextStyle: TextStyles.appbarTextStyle(),
      ),
    );
  }

  ThemeData createTheme();
}
