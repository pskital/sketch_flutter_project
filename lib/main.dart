import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/data/providers/local_storage_provider.dart';
import 'package:sketch_flutter_project/data/providers/localizations_provider.dart';
import 'package:sketch_flutter_project/data/repositories/localizations_repository.dart';
import 'package:sketch_flutter_project/data/repositories/theme_repository.dart';
import 'package:sketch_flutter_project/data/storage/local_storage/shared_preferences_storage.dart';
import 'package:sketch_flutter_project/ui/sketch_flutter_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageProvider(localStorage: SharedPreferencesStorage())
      .initStorage();

  var localizationsRepository = LocalizationsRepository();
  await localizationsRepository.initLang();

  var themeRepository = ThemeRepository();
  await themeRepository.initTheme();

  var localizationsProvider = LocalizationsProvider(localizationsRepository);
  var systemLocales = WidgetsBinding.instance.window.locales;
  localizationsProvider.systemLocale = systemLocales[0];
  await localizationsProvider.loadTranslations();

  runApp(SketchFlutterApp(
    localizationsProvider: localizationsProvider,
    themeRepository: themeRepository,
  ));
}
