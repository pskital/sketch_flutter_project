import 'package:sketch_flutter_project/ui/dashboard_scene/dashboard_page.dart';
import 'package:sketch_flutter_project/ui/login_user_scene/login_user_page.dart';
import 'package:sketch_flutter_project/ui/password_recovery_scene/password_recovery_page.dart';
import 'package:sketch_flutter_project/ui/settings_scene/settings_page.dart';

class AppRoute {
  static const String loginPage = '/';
  static const String settingsPage = '/settings';
  static const String dashboardPage = '/dashboard';
  static const String passwordRecovery = '/redux';

  final appRoutes = {
    AppRoute.loginPage: (context) => LoginUserPage(),
    AppRoute.settingsPage: (context) => SettingsPage(),
    AppRoute.dashboardPage: (context) => DashboardPage(),
    AppRoute.passwordRecovery: (context) => PasswordRecoveryPage(),
  };
}
