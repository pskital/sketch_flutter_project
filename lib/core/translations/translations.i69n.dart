// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;

String get _languageCode => 'en';
String get _localeName => 'en';

String _plural(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.plural(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _ordinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.ordinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _cardinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.cardinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);

class Translations implements i69n.I69nMessageBundle {
  const Translations();
  LoginTranslations get login => LoginTranslations(this);
  SettingsTranslations get settings => SettingsTranslations(this);
  DashboardTranslations get dashboard => DashboardTranslations(this);
  PasswordRecoveryTranslations get passwordRecovery =>
      PasswordRecoveryTranslations(this);
  ErrorsTranslations get errors => ErrorsTranslations(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'login':
        return login;
      case 'settings':
        return settings;
      case 'dashboard':
        return dashboard;
      case 'passwordRecovery':
        return passwordRecovery;
      case 'errors':
        return errors;
      default:
        return key;
    }
  }
}

class LoginTranslations implements i69n.I69nMessageBundle {
  final Translations _parent;
  const LoginTranslations(this._parent);
  String get pageTitle => "Login page";
  String get login => "Login";
  String get password => "Password";
  String get passwordRecovery => "Password recovery";
  String get liginSubmit => "Login";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'pageTitle':
        return pageTitle;
      case 'login':
        return login;
      case 'password':
        return password;
      case 'passwordRecovery':
        return passwordRecovery;
      case 'liginSubmit':
        return liginSubmit;
      default:
        return key;
    }
  }
}

class SettingsTranslations implements i69n.I69nMessageBundle {
  final Translations _parent;
  const SettingsTranslations(this._parent);
  String get appereanceHeader => "Appereance";
  String get light => "Light";
  String get dark => "Dark";
  String get system => "System";
  String get custom => "Custom";
  String get language => "Language";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'appereanceHeader':
        return appereanceHeader;
      case 'light':
        return light;
      case 'dark':
        return dark;
      case 'system':
        return system;
      case 'custom':
        return custom;
      case 'language':
        return language;
      default:
        return key;
    }
  }
}

class DashboardTranslations implements i69n.I69nMessageBundle {
  final Translations _parent;
  const DashboardTranslations(this._parent);
  String get settings => "Settings";
  String get home => "Home";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'settings':
        return settings;
      case 'home':
        return home;
      default:
        return key;
    }
  }
}

class PasswordRecoveryTranslations implements i69n.I69nMessageBundle {
  final Translations _parent;
  const PasswordRecoveryTranslations(this._parent);
  String get pageTitle => "Password recovery";
  String get email => "Email";
  String get sendButton => "Send";
  String get passwordRecoverySuccess => "Password recovery success";
  String get passwordRecoveryError => "Password recovery error";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'pageTitle':
        return pageTitle;
      case 'email':
        return email;
      case 'sendButton':
        return sendButton;
      case 'passwordRecoverySuccess':
        return passwordRecoverySuccess;
      case 'passwordRecoveryError':
        return passwordRecoveryError;
      default:
        return key;
    }
  }
}

class ErrorsTranslations implements i69n.I69nMessageBundle {
  final Translations _parent;
  const ErrorsTranslations(this._parent);
  String get connectionTimeout => "Connection timeout";
  String get connectionError => "Connection error";
  String get forbidden => "Forbidden";
  String get serverInternalError => "Server error";
  String get internalError => "An error occurred";
  String get unauthorized => "Bad credentials";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'connectionTimeout':
        return connectionTimeout;
      case 'connectionError':
        return connectionError;
      case 'forbidden':
        return forbidden;
      case 'serverInternalError':
        return serverInternalError;
      case 'internalError':
        return internalError;
      case 'unauthorized':
        return unauthorized;
      default:
        return key;
    }
  }
}
