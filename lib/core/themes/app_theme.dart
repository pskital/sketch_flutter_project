import 'package:flutter/material.dart';

abstract class AppTheme {
  ThemeData get() {
    var themeData = createTheme();
    return themeData.copyWith(
        textTheme: themeData.textTheme.apply(/*fontFamily: FontFamily.normal*/),
        appBarTheme: themeData.appBarTheme.copyWith(centerTitle: false));
  }

  ThemeData createTheme();
}
