import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';
import 'package:sketch_flutter_project/data/repositories/translations_repository.dart';
import 'package:sketch_flutter_project/logic/localization/lang_event.dart';
import 'package:sketch_flutter_project/logic/localization/lang_state.dart';

class TranslationsBloc extends Bloc<LangEvent, LangState> {
  final TranslationsRepository translationsRepository;

  TranslationsBloc({
    required this.translationsRepository,
  }) : super(const SetLangState(LangType.system)) {
    on<SetSystemLocaleEvent>((event, emit) => _setSystemLocale(event, emit));
    on<SetLanguageEvent>((event, emit) => _setLanguage(event, emit));
  }

  void _setLanguage(SetLanguageEvent event, Emitter<LangState> emit) async {
    var langType = event.langType;
    if (langType != null) {
      await translationsRepository.setLang(langType);
      emit(SetLangState(langType));
    }
  }

  void _setSystemLocale(
    SetSystemLocaleEvent event,
    Emitter<LangState> emit,
  ) async {
    if (state.langType == LangType.system) {
      await translationsRepository.setSystemLocale(event.locales);
      emit(SetSystemLocalesLangState(LangType.system));
    }
  }
}
