import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sketch_flutter_project/data/storage/local_storage/getx_storage.dart';
import 'package:sketch_flutter_project/data/providers/local_storage_provider.dart';

class MockGetXStorage extends Mock implements GetXStorage {}

late MockGetXStorage getXStorage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    getXStorage = MockGetXStorage();
    when(() => getXStorage.init()).thenAnswer((_) => Future.value());
  });

  test('getx storage test', () => _test());
}

_test() async {
  await LocalStorageProvider(localStorage: getXStorage).initStorage();
  var storage = LocalStorageProvider.getLocalStorage();
  expect(MockGetXStorage, storage.runtimeType);
}
