import 'package:sketch_flutter_project/core/enums/theme_type.dart';

abstract class ThemeRepository {
  Future<void> saveTheme(ThemeType theme);

  String? getTheme();
}
