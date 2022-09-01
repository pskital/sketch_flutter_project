import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/core/enums/theme_type.dart';
import 'package:sketch_flutter_project/core/themes/custom_theme.dart';
import 'package:sketch_flutter_project/core/themes/dark_theme.dart';
import 'package:sketch_flutter_project/core/themes/light_theme.dart';
import 'package:sketch_flutter_project/logic/theme/theme_action.dart';
import 'package:sketch_flutter_project/repositories/local/theme_repository/theme_repository.dart';

@injectable
class ThemeBloc extends Bloc<ChangeThemeAction, ThemeType> {
  ThemeBloc({required this.themeRepository}) : super(ThemeType.system) {
    on<ChangeThemeAction>(_onChangeTheme);
  }

  final ThemeRepository themeRepository;

  Future<void> _onChangeTheme(
    ChangeThemeAction event,
    Emitter<ThemeType> emit,
  ) async {
    final ThemeType? themeType = event.themeType;
    if (themeType != null) {
      await themeRepository.saveTheme(themeType);
      emit(themeType);
    }
  }

  ThemeMode getThemeMode() {
    switch (_getThemeType()) {
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
    switch (_getThemeType()) {
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

  ThemeType _getThemeType() {
    try {
      return ThemeType.values.byName(themeRepository.getTheme()!);
    } catch (_) {
      return ThemeType.system;
    }
  }
}
