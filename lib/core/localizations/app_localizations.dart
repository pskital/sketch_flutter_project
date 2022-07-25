import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/data/providers/localizations_provider.dart';

class AppLocalizationsDelegate
    extends LocalizationsDelegate<LocalizationsProvider> {
  final LocalizationsProvider localizationsProvider;

  const AppLocalizationsDelegate(this.localizationsProvider);

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<LocalizationsProvider> load(Locale locale) async {
    localizationsProvider.systemLocale = locale;
    await localizationsProvider.loadTranslations();
    return SynchronousFuture<LocalizationsProvider>(localizationsProvider);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) {
    return true;
  }
}
