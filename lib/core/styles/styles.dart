import 'package:flutter/material.dart';

class Styles {
  Styles._();

  static TextStyle? headerTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1;
  }

  static TextStyle? bodyTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2;
  }
}
