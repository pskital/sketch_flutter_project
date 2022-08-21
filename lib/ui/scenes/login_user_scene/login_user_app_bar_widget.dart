import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/utils/app_translations.dart';
import 'package:sketch_flutter_project/ui/widgets/app_bar_base_widget.dart';

class AppBarWidget extends AppBarBaseWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        AppTranslations.get().login.pageTitle,
      ),
    );
  }
}
