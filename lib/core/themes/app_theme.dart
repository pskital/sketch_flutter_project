import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/fonts/font_family.dart';
import 'package:sketch_flutter_project/core/fonts/font_size.dart';

abstract class AppTheme {
  ThemeData get() {
    var themeData = createTheme();

    return themeData.copyWith(
        textTheme: themeData.textTheme.apply(
          fontFamily: FontFamily.audiTypeNormal,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(1, 50),
                textStyle: const TextStyle(fontSize: FontSize.size18))),
        appBarTheme: themeData.appBarTheme.copyWith(
          centerTitle: false,
          titleTextStyle: const TextStyle(
            fontSize: FontSize.size24,
          ).merge(themeData.appBarTheme.titleTextStyle),
        ));
  }

  ThemeData createTheme();
}
