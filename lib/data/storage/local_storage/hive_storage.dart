import 'package:hive/hive.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';

class HiveStorage implements LocalStorage {
  late Box<dynamic> _box;

  @override
  T? getValue<T>(String key) {
    return _box.get(key);
  }

  @override
  Future<void> init() async {
    Hive.init('hive');

    _box = await Hive.openBox('app_hive_box');
  }

  @override
  Future<void> saveValue<T>(String key, T value) {
    return _box.put(key, value);
  }
}
