import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/core/enums/theme_type.dart';
import 'package:sketch_flutter_project/data/repositories/theme_repository/theme_repository.dart';
import 'package:sketch_flutter_project/logic/theme/theme_action.dart';

@injectable
class ThemeBloc extends Bloc<ChangeThemeAction, ThemeType> {
  final ThemeRepository themeRepository;

  ThemeBloc({required this.themeRepository})
      : super(themeRepository.themeType) {
    on<ChangeThemeAction>(_onChangeTheme);
  }

  void _onChangeTheme(ChangeThemeAction event, Emitter<ThemeType> emit) async {
    var themeType = event.themeType;
    if (themeType != null) {
      await themeRepository.setTheme(themeType);
      emit(themeType);
    }
  }

  ThemeMode getThemeMode() {
    return themeRepository.getThemeMode();
  }

  ThemeData getThemeData() {
    return themeRepository.getThemeData();
  }
}
