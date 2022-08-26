import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';
import 'package:sketch_flutter_project/logic/language/language_bloc.dart';
import 'package:sketch_flutter_project/logic/language/language_event.dart';
import 'package:sketch_flutter_project/logic/language/language_state.dart';
import 'package:sketch_flutter_project/repositories/language_repository/language_repository.dart';

class MockLanguageRepository extends Mock implements LanguageRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late MockLanguageRepository mockLanguageRepository;

  setUp(() {
    mockLanguageRepository = MockLanguageRepository();
  });

  blocTest<LanguageBloc, LanguageState>('test change language',
      setUp: () {
        when(() => mockLanguageRepository.langType).thenReturn(LanguageType.system);
        //Pass the same value to mocked method from when(...) that will be passed during test:
        when(() => mockLanguageRepository.setLanguage(LanguageType.system))
            .thenAnswer((_) async => Future<void>.value());
      },
      wait: const Duration(milliseconds: 500),
      build: () => LanguageBloc(
            languageRepository: mockLanguageRepository,
          ),
      act: (LanguageBloc bloc) {
        bloc.add(const SetLanguageEvent(langType: LanguageType.pl));
      },
      expect: () => <LanguageState>[
            const SetLanguageState(LanguageType.pl),
          ],);
}
