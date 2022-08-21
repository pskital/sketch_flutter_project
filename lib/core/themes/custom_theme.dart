import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sketch_flutter_project/core/themes/app_theme.dart';

class CustomTheme extends AppTheme {
  @override
  ThemeData createTheme() {
    final Brightness brightness = TargetPlatform.iOS == defaultTargetPlatform
        ? Brightness.dark
        : Brightness.light;

    final ThemeData themeData = ThemeData(
      colorScheme: const ColorScheme.light(
        primary: Colors.orange,
        secondary: Colors.orangeAccent,
      ),
    );

    return themeData.copyWith(
      textTheme: themeData.textTheme.apply(
        bodyColor: Colors.orange,
        displayColor: Colors.red,
        decorationColor: Colors.blue,
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: brightness,
          statusBarIconBrightness: brightness,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
          const Set<MaterialState> interactiveStates = <MaterialState>{
            MaterialState.selected,
          };
          if (states.any(interactiveStates.contains)) {
            return Colors.orange;
          }
          return Colors.grey;
        }),
      ),
    );
  }
}
