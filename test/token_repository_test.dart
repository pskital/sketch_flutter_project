import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sketch_flutter_project/data/providers/local_storage_provider.dart';
import 'package:sketch_flutter_project/data/repositories/token_repository.dart';
import 'package:sketch_flutter_project/data/storage/local_storage/shared_preferences_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('token repository test', () => _tokenRepositoryTest());
}

_tokenRepositoryTest() async {
  var localStorage = await LocalStorageProvider(
    localStorage: SharedPreferencesStorage(),
  ).initStorage();

  TokenRepository repository = TokenRepository(localStorage: localStorage);
  expect(await repository.getToken(), null);

  var testToken = 'test-token';
  await repository.saveToken(testToken);
  expect(await repository.getToken(), testToken);

  await repository.saveToken(null);
  expect(await repository.getToken(), null);
}
