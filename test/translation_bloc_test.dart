import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';
import 'package:sketch_flutter_project/core/utils/asset_loader.dart';
import 'package:sketch_flutter_project/data/repositories/translations_repository.dart';
import 'package:sketch_flutter_project/logic/localization/lang_event.dart';
import 'package:sketch_flutter_project/logic/localization/lang_state.dart';
import 'package:sketch_flutter_project/logic/localization/translation_bloc.dart';

class MockTranslationRepository extends Mock implements TranslationsRepository {
}

class MockRootBundleAssetLoader extends Mock implements RootBundleAssetLoader {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late MockTranslationRepository mockTranslationRepo;
  late RootBundleAssetLoader mockAssetsLoader;

  setUp(() {
    mockAssetsLoader = MockRootBundleAssetLoader();
    mockTranslationRepo = MockTranslationRepository();
  });

  blocTest<TranslationsBloc, LangState>('test translation bloc',
      setUp: () {
        when(() => mockTranslationRepo.langType).thenReturn(LangType.system);
        //Pass the same value to mocked method from when(...) that will be passed during test:
        when(() => mockAssetsLoader.load(
                'assets/translations', const Locale('en')))
            .thenAnswer(
                (_) async => Future<Map<String, String>>.value({'a': 'b'}));
        when(() => mockTranslationRepo.setLang(LangType.system))
            .thenAnswer((_) async => Future<void>.value());
      },
      wait: const Duration(milliseconds: 500),
      build: () => TranslationsBloc(
            translationsRepository: mockTranslationRepo,
          ),
      act: (bloc) {
        bloc.add(const SetLanguageEvent(langType: LangType.en));
      },
      expect: () => [
            const SetLangState(LangType.en),
          ]);
}
