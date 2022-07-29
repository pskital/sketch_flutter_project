import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';
import 'package:sketch_flutter_project/core/utils/asset_loader.dart';
import 'package:sketch_flutter_project/data/repositories/language_repository.dart';
import 'package:sketch_flutter_project/logic/localization/language_bloc.dart';
import 'package:sketch_flutter_project/logic/localization/language_event.dart';
import 'package:sketch_flutter_project/logic/localization/language_state.dart';

class MockLanguageRepository extends Mock implements LanguageRepository {}

class MockRootBundleAssetLoader extends Mock implements RootBundleAssetLoader {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late MockLanguageRepository mockLanguageRepository;
  late RootBundleAssetLoader mockAssetsLoader;

  setUp(() {
    mockAssetsLoader = MockRootBundleAssetLoader();
    mockLanguageRepository = MockLanguageRepository();
  });

  blocTest<LanguageBloc, LanguageState>('test change language',
      setUp: () {
        when(() => mockLanguageRepository.langType).thenReturn(LangType.system);
        //Pass the same value to mocked method from when(...) that will be passed during test:
        when(() => mockAssetsLoader.load(
                'assets/translations', const Locale('en')))
            .thenAnswer(
                (_) async => Future<Map<String, String>>.value({'a': 'b'}));
        when(() => mockLanguageRepository.setLanguage(LangType.system))
            .thenAnswer((_) async => Future<void>.value());
      },
      wait: const Duration(milliseconds: 500),
      build: () => LanguageBloc(
            languageRepository: mockLanguageRepository,
          ),
      act: (bloc) {
        bloc.add(const SetLanguageEvent(langType: LangType.pl));
      },
      expect: () => [
            const SetLanguageState(LangType.pl),
          ]);
}
