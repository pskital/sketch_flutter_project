import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/constants/storage_keys.dart';
import 'package:sketch_flutter_project/core/enums/theme_type.dart';
import 'package:sketch_flutter_project/core/themes/custom_theme.dart';
import 'package:sketch_flutter_project/core/themes/dark_theme.dart';
import 'package:sketch_flutter_project/core/themes/light_theme.dart';
import 'package:sketch_flutter_project/data/repositories/theme_repository/theme_repository.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';

class ThemeRepositoryImp implements ThemeRepository {
  final LocalStorage localStorage;

  late ThemeType _themeType;

  ThemeRepositoryImp({required this.localStorage});

  @override
  ThemeType get themeType => _themeType;

  @override
  Future<void> initTheme() async {
    _themeType = await _getThemeType();
  }

  @override
  Future<void> setTheme(ThemeType theme) async {
    var value = theme.value;
    await _saveTheme(value);
    _themeType = theme;
  }

  @override
  ThemeMode getThemeMode() {
    var type = _themeType;
    switch (type) {
      case ThemeType.system:
        return ThemeMode.system;
      case ThemeType.dark:
        return ThemeMode.dark;
      case ThemeType.custom:
      case ThemeType.light:
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  @override
  ThemeData getThemeData() {
    var type = _themeType;
    switch (type) {
      case ThemeType.dark:
        return DarkTheme().get();
      case ThemeType.custom:
        return CustomTheme().get();
      case ThemeType.system:
      case ThemeType.light:
      default:
        return LightTheme().get();
    }
  }

  Future<void> _saveTheme(String theme) async {
    return await localStorage.saveValue(StorageKeys.themeKey, theme);
  }

  Future<ThemeType> _getThemeType() async {
    var theme = await localStorage.getValue(StorageKeys.themeKey);
    return ThemeType.values.firstWhere((t) {
      var type = t.toString().split('.').last;
      return type == theme;
    }, orElse: () => ThemeType.system);
  }
}
