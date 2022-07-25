import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/constants/lang_type.dart';
import 'package:sketch_flutter_project/data/providers/localizations_provider.dart';
import 'package:sketch_flutter_project/data/repositories/localizations_repository.dart';
import 'package:sketch_flutter_project/logic/localization/lang_state.dart';

class LocalizationsBloc extends BlocBase<LangState> {
  final _localizationsProvider = LocalizationsProvider.get();
  final LocalizationsRepository repository;

  LocalizationsBloc({required this.repository})
      : super(LangState(repository.langType, null));

  void setLang(LangType? langType) async {
    if (langType != null) {
      await repository.setLang(langType);
      await _localizationsProvider.loadTranslations();

      emit(LangState(langType, getLangCode()));
    }
  }

  void systemLocaleChange(List<Locale>? locales) async {
    if (state.langType == LangType.system) {
      _localizationsProvider.systemLocale = locales?.first;
      await _localizationsProvider.loadTranslations();
    }

    emit(LangState(LangType.system, getLangCode()));
  }

  String? getLangCode() {
    return _localizationsProvider.systemLocale?.languageCode;
  }
}
