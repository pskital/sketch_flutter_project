import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sketch_flutter_project/core/constants/lang_type.dart';
import 'package:sketch_flutter_project/data/providers/localizations_provider.dart';
import 'package:sketch_flutter_project/data/repositories/localizations_repository.dart';
import 'package:sketch_flutter_project/logic/localization/lang_state.dart';
import 'package:sketch_flutter_project/logic/localization/localizations_bloc.dart';

class MockLocalizationsRepository extends Mock
    implements LocalizationsRepository {}

class MockLocalizationsProvider extends Mock implements LocalizationsProvider {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late MockLocalizationsProvider mockedProvider;
  late MockLocalizationsRepository mockedRepo;

  setUp(() {
    mockedProvider = MockLocalizationsProvider();
    mockedRepo = MockLocalizationsRepository();
  });

  blocTest<LocalizationsBloc, LangState>('test ',
      setUp: () {
        when(() => mockedProvider.getSystemLocale())
            .thenAnswer((_) => const Locale('en', 'EN'));
        when(() => mockedProvider.loadTranslations())
            .thenAnswer((_) => Future.value());
        when(() => mockedRepo.setLang(LangType.en))
            .thenAnswer((_) => Future.value());
        when(() => mockedRepo.langType).thenAnswer((_) => LangType.en);
      },
      wait: const Duration(milliseconds: 500),
      build: () => LocalizationsBloc(
            locationRepository: mockedRepo,
            localizationsProvider: mockedProvider,
          ),
      act: (bloc) {
        bloc.setLang(LangType.en);
      },
      expect: () => <LangState>[
            const LangState(LangType.en, 'en'),
          ]);
}
