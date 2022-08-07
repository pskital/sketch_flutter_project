import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/data/repositories/language_repository/language_repository.dart';
import 'package:sketch_flutter_project/data/repositories/language_repository/language_repository_imp.dart';
import 'package:sketch_flutter_project/data/repositories/theme_repository/theme_repository.dart';
import 'package:sketch_flutter_project/data/repositories/theme_repository/theme_repository_imp.dart';

@module
abstract class RepositoryModule {
  @preResolve
  Future<ThemeRepository> provideThemeRepository(
    ThemeRepositoryImp themeRepositoryImp,
  ) async {
    await themeRepositoryImp.initTheme();
    return themeRepositoryImp;
  }

  @preResolve
  Future<LanguageRepository> provideLanguageRepository(
    LanguageRepositoryImp languageRepository,
  ) async {
    var systemLocales = WidgetsBinding.instance.window.locales;
    await languageRepository.setSystemLocale(systemLocales);
    return languageRepository;
  }
}
