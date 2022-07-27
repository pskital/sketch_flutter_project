import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/constants/paddings.dart';
import 'package:sketch_flutter_project/core/extensions/string_translate_extension.dart';
import 'package:sketch_flutter_project/ui/settings_scene/lang_settings_widget.dart';
import 'package:sketch_flutter_project/ui/settings_scene/theme_settings_widget.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage() : super(key: UniqueKey());

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
              ThemeSettingsWidget(),
              LangSettingsWidget(),
            ],
          ),
        ));
  }
}
