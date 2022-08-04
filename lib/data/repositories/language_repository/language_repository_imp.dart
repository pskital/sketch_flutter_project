import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/constants/storage_keys.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';
import 'package:sketch_flutter_project/core/utils/asset_loader.dart';
import 'package:sketch_flutter_project/core/utils/translations.dart';
import 'package:sketch_flutter_project/data/repositories/language_repository/language_repository.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';

class LanguageRepositoryImp implements LanguageRepository {
  final _defaultLocale = const Locale('en', 'EN');

  final _supportedLocales = [
    const Locale('pl', 'PL'),
    const Locale('en', 'EN'),
  ];

  Locale? _systemLocale;

  final RootBundleAssetLoader assetLoader;
  final LocalStorage localStorage;

  @override
  LangType langType = LangType.system;

  LanguageRepositoryImp({
    required this.localStorage,
    required this.assetLoader,
  }) {
    langType = _getLangType();
  }

  @override
  setLanguage(LangType langType) async {
    var value = langType.value;
    this.langType = langType;

    await _saveLanguage(value);
    await _loadTranslations();
  }

  @override
  setSystemLocale(List<Locale>? locales) async {
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
        var typeValue = langType.value;
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
    var lang = localStorage.getValue(StorageKeys.langKey);
    return LangType.values.firstWhere((t) {
      var type = t.toString().split('.').last;
      return type == lang;
    }, orElse: () => LangType.system);
  }

  bool _isLocaleSupported(Locale locale) {
    return _supportedLocales
        .map((e) => e.languageCode)
        .contains(locale.languageCode);
  }

  _loadTranslations() async {
    var code = _getLocale().languageCode;
    var data = await assetLoader.load('assets/translations', Locale(code));
    Translations.translations = Map<String, String>.from(data);
  }
}
