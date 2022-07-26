import 'package:sketch_flutter_project/data/providers/localizations_provider.dart';

extension StringTranslateExtension on String {
  String tr() => LocalizationsProvider.tr(this);
}
