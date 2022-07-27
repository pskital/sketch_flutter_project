import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sketch_flutter_project/data/providers/storage_provider.dart';
import 'package:sketch_flutter_project/data/storage/local_storage/shared_preferences_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('shared preferences storage test', () => _test());
}

_test() async {
  await StorageProvider(localStorage: SharedPreferencesStorage()).initStorage();
  var storage = StorageProvider.getLocalStorage();
  expect(SharedPreferencesStorage, storage.runtimeType);
}
