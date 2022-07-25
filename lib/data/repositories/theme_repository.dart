import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/constants/storage_keys.dart';
import 'package:sketch_flutter_project/core/constants/theme_type.dart';
import 'package:sketch_flutter_project/core/themes/custom_theme.dart';
import 'package:sketch_flutter_project/core/themes/dark_theme.dart';
import 'package:sketch_flutter_project/core/themes/light_theme.dart';
import 'package:sketch_flutter_project/data/providers/local_storage_provider.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';

class ThemeRepository {
  final LocalStorage _localStorage = LocalStorageProvider.getLocalStorage();

  late ThemeType _themeType;

  ThemeType get themeType => _themeType;

  Future<void> initTheme() async {
    _themeType = await getThemeType();
  }

  Future<void> setTheme(ThemeType theme) async {
    var value = theme.value;
    await saveTheme(value);
    _themeType = theme;
  }

  Future<void> saveTheme(String theme) async {
    return await _localStorage.saveValue(StorageKeys.themeKey, theme);
  }

  Future<ThemeType> getThemeType() async {
    var theme = await _localStorage.getValue(StorageKeys.themeKey);
    return ThemeType.values.firstWhere((t) {
      var type = t.toString().split('.').last;
      return type == theme;
    }, orElse: () => ThemeType.system);
  }

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
}
