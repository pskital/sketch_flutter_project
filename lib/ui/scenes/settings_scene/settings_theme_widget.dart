import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/theme_type.dart';
import 'package:sketch_flutter_project/core/extensions/translation_extension.dart';
import 'package:sketch_flutter_project/core/styles/styles.dart';
import 'package:sketch_flutter_project/logic/theme/theme_action.dart';
import 'package:sketch_flutter_project/logic/theme/theme_bloc.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_widget.dart';

class SettingThemeWidget extends BlocWidget<ThemeBloc, ThemeType> {
  @override
  Widget buildWidget(BuildContext context, ThemeBloc bloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10),
        Text(
          'appAppearance'.tr(),
          style: Styles.headerTextStyle(context),
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Radio<ThemeType>(
              value: ThemeType.system,
              groupValue: bloc.state,
              onChanged: (ThemeType? themeType) =>
                  _changeTheme(themeType, bloc),
            ),
            Text(
              'appAppearanceSystem'.tr(),
              style: Styles.bodyTextStyle(context),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Radio<ThemeType>(
              value: ThemeType.light,
              groupValue: bloc.state,
              onChanged: (ThemeType? themeType) =>
                  _changeTheme(themeType, bloc),
            ),
            Text(
              'appAppearanceLight'.tr(),
              style: Styles.bodyTextStyle(context),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Radio<ThemeType>(
              value: ThemeType.dark,
              groupValue: bloc.state,
              onChanged: (ThemeType? themeType) =>
                  _changeTheme(themeType, bloc),
            ),
            Text(
              'appAppearanceDark'.tr(),
              style: Styles.bodyTextStyle(context),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Radio<ThemeType>(
              value: ThemeType.custom,
              groupValue: bloc.state,
              onChanged: (ThemeType? themeType) =>
                  _changeTheme(themeType, bloc),
            ),
            Text(
              'appAppearanceCustom'.tr(),
              style: Styles.bodyTextStyle(context),
            )
          ],
        ),
        const SizedBox(height: 10),
        Container(height: 1, color: Colors.grey),
        const SizedBox(height: 10),
      ],
    );
  }

  void _changeTheme(ThemeType? themeType, ThemeBloc bloc) {
    bloc.add(ChangeThemeAction(themeType: themeType));
  }
}
