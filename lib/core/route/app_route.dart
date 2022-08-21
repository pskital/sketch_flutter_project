import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/ui/scenes/dashboard_scene/dashboard_page.dart';
import 'package:sketch_flutter_project/ui/scenes/login_user_scene/login_user_page.dart';
import 'package:sketch_flutter_project/ui/scenes/password_recovery_scene/password_recovery_page.dart';
import 'package:sketch_flutter_project/ui/scenes/settings_scene/settings_page.dart';

class AppRoute {
  static const String loginPage = '/';
  static const String settingsPage = '/settings';
  static const String dashboardPage = '/dashboard';
  static const String passwordRecovery = '/redux';

  final Map<String, StatelessWidget Function(BuildContext context)> appRoutes =
      <String, StatelessWidget Function(BuildContext context)>{
    AppRoute.loginPage: (BuildContext context) => LoginUserPage(),
    AppRoute.settingsPage: (BuildContext context) => SettingsPage(),
    AppRoute.dashboardPage: (BuildContext context) => DashboardPage(),
    AppRoute.passwordRecovery: (BuildContext context) => PasswordRecoveryPage(),
  };
}
