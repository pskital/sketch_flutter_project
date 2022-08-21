import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/fonts/font_size.dart';

class TextStyles {
  TextStyles._();

  static TextStyle appbarTextStyle() {
    return const TextStyle(
      fontSize: FontSize.size24,
    );
  }

  static TextStyle headerTextStyle() {
    return const TextStyle(
      fontSize: FontSize.size18,
    );
  }

  static TextStyle bodyTextStyle() {
    return const TextStyle(
      fontSize: FontSize.size16,
    );
  }

  static TextStyle buttonTextStyle() {
    return const TextStyle(
      fontSize: FontSize.size18,
      fontWeight: FontWeight.bold,
    );
  }
}
