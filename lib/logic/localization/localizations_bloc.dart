import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/constants/lang_type.dart';
import 'package:sketch_flutter_project/data/providers/localizations_provider.dart';
import 'package:sketch_flutter_project/data/repositories/localizations_repository.dart';
import 'package:sketch_flutter_project/logic/localization/lang_state.dart';

class LocalizationsBloc extends BlocBase<LangState> {
  final LocalizationsProvider localizationsProvider;
  final LocalizationsRepository locationRepository;

  LocalizationsBloc({
    required this.locationRepository,
    required this.localizationsProvider,
  }) : super(LangState(locationRepository.langType, null));

  void setLang(LangType? langType) async {
    if (langType != null) {
      await locationRepository.setLang(langType);
      await localizationsProvider.loadTranslations();

      emit(LangState(langType, getLangCode()));
    }
  }

  void systemLocaleChange(List<Locale>? locales) async {
    if (state.langType == LangType.system) {
      localizationsProvider.setSystemLocale(locales);
      await localizationsProvider.loadTranslations();
      emit(LangState(LangType.system, getLangCode()));
    }
  }

  String? getLangCode() {
    return localizationsProvider.getSystemLocale()?.languageCode;
  }
}
