// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;
import 'translations.i69n.dart';

String get _languageCode => 'pl';
String get _localeName => 'pl';

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

class Translations_pl extends Translations {
  const Translations_pl();
  LoginTranslations_pl get login => LoginTranslations_pl(this);
  SettingsTranslations_pl get settings => SettingsTranslations_pl(this);
  DashboardTranslations_pl get dashboard => DashboardTranslations_pl(this);
  PasswordRecoveryTranslations_pl get passwordRecovery =>
      PasswordRecoveryTranslations_pl(this);
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
      default:
        return super[key];
    }
  }
}

class LoginTranslations_pl extends LoginTranslations {
  final Translations_pl _parent;
  const LoginTranslations_pl(this._parent) : super(_parent);
  String get pageTitle => "Logowanie";
  String get login => "Login";
  String get password => "Hasło";
  String get passwordRecovery => "Odzyskiwanie hasła";
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
      default:
        return super[key];
    }
  }
}

class SettingsTranslations_pl extends SettingsTranslations {
  final Translations_pl _parent;
  const SettingsTranslations_pl(this._parent) : super(_parent);
  String get appereanceHeader => "Wygląd";
  String get light => "Jasny";
  String get dark => "Ciemny";
  String get system => "System";
  String get custom => "Niestandardowy";
  String get language => "Język";
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
        return super[key];
    }
  }
}

class DashboardTranslations_pl extends DashboardTranslations {
  final Translations_pl _parent;
  const DashboardTranslations_pl(this._parent) : super(_parent);
  String get settings => "Ustawienia";
  String get home => "Dom";
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
        return super[key];
    }
  }
}

class PasswordRecoveryTranslations_pl extends PasswordRecoveryTranslations {
  final Translations_pl _parent;
  const PasswordRecoveryTranslations_pl(this._parent) : super(_parent);
  String get pageTitle => "Odzyskaj hasło";
  String get email => "Email";
  String get sendButton => "Wyślij";
  String get passwordRecoverySuccess =>
      "Odzyskiwanie hasła zakośczone sukcesem";
  String get passwordRecoveryError => "Błąd odzyskiwania hasła";
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
        return super[key];
    }
  }
}
