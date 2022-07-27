import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/extensions/string_translate_extension.dart';
import 'package:sketch_flutter_project/core/route/app_route.dart';
import 'package:sketch_flutter_project/ui/widgets/app_bar_base_widget.dart';

class AppBarWidget extends AppBarBaseWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'loginPage'.tr(),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, AppRoute.settingsPage);
          },
        )
      ],
    );
  }
}
