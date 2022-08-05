import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/core/enums/theme_type.dart';
import 'package:sketch_flutter_project/data/repositories/theme_repository/theme_repository.dart';

@injectable
class ThemeBloc extends BlocBase<ThemeType> {
  final ThemeRepository themeRepository;

  ThemeBloc({required this.themeRepository}) : super(themeRepository.themeType);

  void setTheme(ThemeType? theme) async {
    if (theme != null) {
      await themeRepository.setTheme(theme);
      emit(theme);
    }
  }

  ThemeMode getThemeMode() {
    return themeRepository.getThemeMode();
  }

  ThemeData getThemeData() {
    return themeRepository.getThemeData();
  }
}
