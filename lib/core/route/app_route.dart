import 'package:sketch_flutter_project/ui/login_user_scene/login_user_page.dart';
import 'package:sketch_flutter_project/ui/settings_scene/settings_page.dart';

class AppRoute {
  static const String loginPage = '/';
  static const String settingsPage = '/settings';

  final appRoutes = {
    AppRoute.loginPage: (context) => LoginUserPage(),
    AppRoute.settingsPage: (context) => SettingsPage(),
  };
}
