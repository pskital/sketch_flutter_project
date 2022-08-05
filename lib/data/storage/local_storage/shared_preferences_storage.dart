import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sketch_flutter_project/data/storage/local_storage.dart';

@Singleton()
class SharedPreferencesStorage implements LocalStorage {
  late SharedPreferences _sharedPreferences;

  @override
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<void> saveValue<T>(String key, value) async {
    if (value is String) {
      await _sharedPreferences.setString(key, value);
    } else {
      await _sharedPreferences.remove(key);
    }
  }

  @override
  T? getValue<T>(String key) {
    return _sharedPreferences.get(key) as T?;
  }
}
