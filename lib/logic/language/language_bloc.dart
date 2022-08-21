import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';
import 'package:sketch_flutter_project/data/repositories/language_repository/language_repository.dart';
import 'package:sketch_flutter_project/logic/language/language_event.dart';
import 'package:sketch_flutter_project/logic/language/language_state.dart';

@injectable
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc({required this.languageRepository})
      : super(SetLanguageState(languageRepository.langType)) {
    on<SetSystemLocaleEvent>(
      (SetSystemLocaleEvent event, Emitter<LanguageState> emit) =>
          _setSystemLocale(event, emit),
    );
    on<SetLanguageEvent>(
      (SetLanguageEvent event, Emitter<LanguageState> emit) =>
          _setLanguage(event, emit),
    );
  }

  final LanguageRepository languageRepository;

  Future<void> _setLanguage(
    SetLanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    final LangType? langType = event.langType;
    if (langType != null) {
      await languageRepository.setLanguage(langType);
      emit(SetLanguageState(langType));
    }
  }

  Future<void> _setSystemLocale(
    SetSystemLocaleEvent event,
    Emitter<LanguageState> emit,
  ) async {
    if (state.langType == LangType.system) {
      await languageRepository.setSystemLocale(event.locales);
      emit(SetSystemLocalesState(LangType.system));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
