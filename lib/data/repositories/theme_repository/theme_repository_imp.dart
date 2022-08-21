import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/core/constants/storage_keys.dart';
import 'package:sketch_flutter_project/core/enums/theme_type.dart';
import 'package:sketch_flutter_project/core/themes/custom_theme.dart';
import 'package:sketch_flutter_project/core/themes/dark_theme.dart';
import 'package:sketch_flutter_project/core/themes/light_theme.dart';
import 'package:sketch_flutter_project/data/repositories/theme_repository/theme_repository.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';

@injectable
class ThemeRepositoryImp implements ThemeRepository {
  ThemeRepositoryImp({required this.localStorage});

  final LocalStorage localStorage;

  late ThemeType _themeType;

  @override
  ThemeType get themeType => _themeType;

  @override
  Future<void> initTheme() async {
    _themeType = await _getThemeType();
  }

  @override
  Future<void> setTheme(ThemeType theme) async {
    final String value = theme.value;
    await _saveTheme(value);
    _themeType = theme;
  }

  @override
  ThemeMode getThemeMode() {
    final ThemeType type = _themeType;
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
    final ThemeType type = _themeType;
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
    final String theme = await localStorage.getValue(StorageKeys.themeKey);
    return ThemeType.values.firstWhere(
      (ThemeType t) {
        final String type = t.toString().split('.').last;
        return type == theme;
      },
      orElse: () => ThemeType.system,
    );
  }
}
