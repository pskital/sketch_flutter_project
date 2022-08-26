import 'package:sketch_flutter_project/core/enums/lang_type.dart';

abstract class LanguageRepository {
  Future<void> saveLanguageCode(LanguageType langType);

  String? getLanguageCode();
}
