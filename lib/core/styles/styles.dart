import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/fonts/font_size.dart';

class Styles {
  Styles._();

  static TextStyle? headerTextStyle(BuildContext context) {
    return _defaultTextStyle(context)
        ?.merge(const TextStyle(fontSize: FontSize.size18));
  }

  static TextStyle? bodyTextStyle(BuildContext context) {
    return _defaultTextStyle(context)
        ?.merge(const TextStyle(fontSize: FontSize.size16));
  }

  static TextStyle? _defaultTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText2;
  }
}
