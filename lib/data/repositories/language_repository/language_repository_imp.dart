import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/core/constants/storage_keys.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';
import 'package:sketch_flutter_project/core/translations/app_translations.dart';
import 'package:sketch_flutter_project/data/dependencies/configure_dependencies.dart';
import 'package:sketch_flutter_project/data/repositories/language_repository/language_repository.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';

@injectable
class LanguageRepositoryImp implements LanguageRepository {
  LanguageRepositoryImp({required this.localStorage}) {
    langType = _getLangType();
  }

  final Locale _defaultLocale = const Locale('en', 'EN');

  final List<Locale> _supportedLocales = <Locale>[
    const Locale('pl', 'PL'),
    const Locale('en', 'EN'),
  ];

  Locale? _systemLocale;

  final LocalStorage localStorage;

  @override
  LangType langType = LangType.system;

  @override
  Future<void> setLanguage(LangType langType) async {
    final String value = langType.value;
    this.langType = langType;

    await _saveLanguage(value);
    await _loadTranslations();
  }

  @override
  Future<void> setSystemLocale(List<Locale>? locales) async {
    if (locales != null && locales.isNotEmpty) {
      _systemLocale = locales.first;
      await _loadTranslations();
    }
  }

  Locale _getLocale() {
    Locale? locale;

    switch (langType) {
      case LangType.system:
        locale = _systemLocale;
        break;
      default:
        final String typeValue = langType.value;
        locale = Locale(typeValue, typeValue.toUpperCase());
        break;
    }

    if (locale != null && _isLocaleSupported(locale)) {
      return locale;
    } else {
      return _defaultLocale;
    }
  }

  Future<void> _saveLanguage(String lang) async {
    return await localStorage.saveValue(StorageKeys.langKey, lang);
  }

  LangType _getLangType() {
    final String? lang = localStorage.getValue(StorageKeys.langKey);
    return LangType.values.firstWhere(
      (LangType t) {
        final String type = t.toString().split('.').last;
        return type == lang;
      },
      orElse: () => LangType.system,
    );
  }

  bool _isLocaleSupported(Locale locale) {
    return _supportedLocales
        .map((Locale e) => e.languageCode)
        .contains(locale.languageCode);
  }

  Future<void> _loadTranslations() async {
    final String code = _getLocale().languageCode;
    final AppTranslations appTranslations = serviceLocator();
    appTranslations.setCurrentTranslations(code);
  }
}
