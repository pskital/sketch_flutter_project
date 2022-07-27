import 'package:sketch_flutter_project/data/repositories/translations_repository.dart';

extension StringTranslateExtension on String {
  String tr() => LanguageRepository.tr(this);
}
