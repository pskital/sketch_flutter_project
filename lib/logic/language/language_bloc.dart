import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/core/constants/language.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';
import 'package:sketch_flutter_project/core/translations/app_translations.dart';
import 'package:sketch_flutter_project/core/dependencies/configure_dependencies.dart';
import 'package:sketch_flutter_project/logic/language/language_event.dart';
import 'package:sketch_flutter_project/logic/language/language_state.dart';
import 'package:sketch_flutter_project/repositories/local/language_repository/language_repository.dart';

@injectable
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc({required this.languageRepository})
      : super(const SetLanguageState(LanguageType.system)) {
    on<UpdateSystemLocaleEvent>(
      (UpdateSystemLocaleEvent event, Emitter<LanguageState> emit) =>
          _updateSystemLocale(event, emit),
    );
    on<SetLanguageEvent>(
      (SetLanguageEvent event, Emitter<LanguageState> emit) =>
          _setLanguage(event, emit),
    );

    _setTranslations();
  }

  final LanguageRepository languageRepository;

  String? _systemLanguageCode =
      WidgetsBinding.instance.window.locales.first.languageCode;

  Future<void> _setLanguage(
    SetLanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    final LanguageType? langType = event.langType;
    if (langType != null) {
      await languageRepository.saveLanguageCode(langType);
      _setTranslations();

      emit(SetLanguageState(langType));
    }
  }

  void _updateSystemLocale(
    UpdateSystemLocaleEvent event,
    Emitter<LanguageState> emit,
  ) {
    _systemLanguageCode = event.locales?.first.languageCode;

    if (state.langType == LanguageType.system) {
      _setTranslations();
      emit(UpdateSystemLocalesState(LanguageType.system));
    }
  }

  String _getLanguageCode() {
    final LanguageType langType = _getLanguageType();
    final String? languageCode;
    switch (langType) {
      case LanguageType.system:
        languageCode = _systemLanguageCode;
        break;
      default:
        languageCode = langType.value;
        break;
    }

    if (languageCode != null && _isLanguageSupported(languageCode)) {
      return languageCode;
    } else {
      return Language.defaultLanguageCode;
    }
  }

  LanguageType _getLanguageType() {
    final String? lang = languageRepository.getLanguageCode();
    return LanguageType.values.firstWhere(
      (LanguageType t) {
        final String type = t.toString().split('.').last;
        return type == lang;
      },
      orElse: () => LanguageType.system,
    );
  }

  bool _isLanguageSupported(String languageCode) =>
      serviceLocator<AppTranslations>()
          .translationsMap
          .keys
          .contains(languageCode);

  void _setTranslations() {
    final String languageCode = _getLanguageCode();
    serviceLocator<AppTranslations>().setTranslations(languageCode);
  }
}
