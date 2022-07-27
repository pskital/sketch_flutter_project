import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/data/providers/localizations_provider.dart';
import 'package:sketch_flutter_project/data/providers/storage_provider.dart';
import 'package:sketch_flutter_project/data/repositories/localizations_repository.dart';
import 'package:sketch_flutter_project/data/repositories/theme_repository.dart';
import 'package:sketch_flutter_project/data/storage/local_storage/shared_preferences_storage.dart';
import 'package:sketch_flutter_project/logic/localization/localizations_bloc.dart';
import 'package:sketch_flutter_project/logic/theme/theme_bloc.dart';

class AppDependencies {
  late LocalizationsProvider localizationsProvider;
  late ThemeRepository themeRepository;

  Future<void> init() async {
    var storageProvider = StorageProvider(
      localStorage: SharedPreferencesStorage(),
    );
    var localStorage = await storageProvider.initStorage();

    var localizationsRepository = LocalizationsRepository(
      localStorage: localStorage,
    );
    await localizationsRepository.initLang();

    themeRepository = ThemeRepository(
      localStorage: localStorage,
    );
    await themeRepository.initTheme();

    localizationsProvider = LocalizationsProvider(
      localizationsRepository: localizationsRepository,
    );
    var systemLocales = WidgetsBinding.instance.window.locales;
    localizationsProvider.setSystemLocale(systemLocales);
    await localizationsProvider.loadTranslations();
  }

  ThemeBloc createThemeBloc() {
    return ThemeBloc(themeRepository: themeRepository);
  }

  LocalizationsBloc createLocalizationBloc() {
    var localizationsRepository = localizationsProvider.localizationsRepository;
    return LocalizationsBloc(
      locationRepository: localizationsRepository,
      localizationsProvider: localizationsProvider,
    );
  }
}
