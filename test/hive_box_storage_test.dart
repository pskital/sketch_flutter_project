import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sketch_flutter_project/data/storage/local_storage/hive_storage.dart';
import 'package:sketch_flutter_project/data/providers/local_storage_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp(() {});

  test('hive box storage test', () => _test());
}

_test() async {
  await LocalStorageProvider(localStorage: HiveStorage()).initStorage();
  var storage = LocalStorageProvider.getLocalStorage();
  expect(HiveStorage, storage.runtimeType);
}
