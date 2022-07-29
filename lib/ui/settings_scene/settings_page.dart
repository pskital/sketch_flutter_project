import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/constants/paddings.dart';
import 'package:sketch_flutter_project/core/extensions/translation_extension.dart';
import 'package:sketch_flutter_project/ui/settings_scene/settings_language_widget.dart';
import 'package:sketch_flutter_project/ui/settings_scene/settings_theme_widget.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'settingsPage'.tr(),
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(Paddings.pagePadding),
            children: const [
              SettingThemeWidget(),
              SettingsLanguageWidget(),
            ],
          ),
        ));
  }
}
