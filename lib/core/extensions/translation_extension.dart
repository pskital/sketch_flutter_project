import 'package:sketch_flutter_project/core/utils/translations.dart';

extension TranslateExtension on String {
  String tr() => Translations.tr(this);
}
