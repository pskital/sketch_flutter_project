import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sketch_flutter_project/data/providers/storage_provider.dart';
import 'package:sketch_flutter_project/data/storage/local_storage/hive_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  test('test hive box storage', () => _test());
}

_test() async {
  await StorageProvider(localStorage: HiveStorage()).initStorage();
  var storage = StorageProvider.getLocalStorage();
  expect(HiveStorage, storage.runtimeType);
}
