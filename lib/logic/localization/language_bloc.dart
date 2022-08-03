import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';
import 'package:sketch_flutter_project/data/repositories/language_repository.dart';
import 'package:sketch_flutter_project/logic/localization/language_event.dart';
import 'package:sketch_flutter_project/logic/localization/language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final LanguageRepository languageRepository;

  LanguageBloc({
    required this.languageRepository,
  }) : super(SetLanguageState(languageRepository.langType)) {
    on<SetSystemLocaleEvent>((event, emit) => _setSystemLocale(event, emit));
    on<SetLanguageEvent>((event, emit) => _setLanguage(event, emit));
  }

  void _setLanguage(SetLanguageEvent event, Emitter<LanguageState> emit) async {
    var langType = event.langType;
    if (langType != null) {
      await languageRepository.setLanguage(langType);
      emit(SetLanguageState(langType));
    }
  }

  void _setSystemLocale(
    SetSystemLocaleEvent event,
    Emitter<LanguageState> emit,
  ) async {
    if (state.langType == LangType.system) {
      await languageRepository.setSystemLocale(event.locales);
      emit(SetSystemLocalesState(LangType.system));
    }
  }
}
