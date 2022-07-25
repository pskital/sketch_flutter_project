import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sketch_flutter_project/core/themes/app_theme.dart';
import 'package:sketch_flutter_project/core/themes/base_theme.dart';

class CustomTheme implements AppTheme {
  @override
  ThemeData get() {
    var brightness = TargetPlatform.iOS == defaultTargetPlatform
        ? Brightness.dark
        : Brightness.light;
    return ThemeData(
        colorScheme: const ColorScheme.light(
      primary: Colors.orange,
      secondary: Colors.orangeAccent,
    )).copyWith(
      appBarTheme: BaseTheme.appBarTheme.copyWith(
          systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: brightness,
        statusBarIconBrightness: brightness,
      )),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
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
