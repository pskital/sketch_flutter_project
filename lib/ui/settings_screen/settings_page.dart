import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/constants/paddings.dart';
import 'package:sketch_flutter_project/data/providers/localizations_provider.dart';
import 'package:sketch_flutter_project/ui/settings_screen/lang_settings_widget.dart';
import 'package:sketch_flutter_project/ui/settings_screen/theme_settings_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('settingsPage'.tr()),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(Paddings.pagePadding),
            children: const [
              ThemeSettingsWidget(),
              LangSettingsPage(),
            ],
          ),
        ));
  }
}
