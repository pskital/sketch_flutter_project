import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/fonts/font_size.dart';

class Styles {
  Styles._();

  static TextStyle? headerTextStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .subtitle1
        ?.merge(const TextStyle(fontSize: FontSize.size18));
  }

  static TextStyle? bodyTextStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyText2
        ?.merge(const TextStyle(fontSize: FontSize.size16));
  }
}
