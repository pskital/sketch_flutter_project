import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/constants/lang_type.dart';
import 'package:sketch_flutter_project/data/providers/localizations_provider.dart';
import 'package:sketch_flutter_project/data/repositories/localizations_repository.dart';

class LocalizationsBloc extends BlocBase<LangType> {
  final LocalizationsRepository localizationRepository;

  LocalizationsBloc({required this.localizationRepository})
      : super(localizationRepository.langType);

  void setLang(LangType? langType) async {
    if (langType != null) {
      await localizationRepository.setLang(langType);
      await LocalizationsProvider.get().loadTranslations();

      emit(langType);
    }
  }
}
