import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/theme_type.dart';
import 'package:sketch_flutter_project/core/styles/text_styles.dart';
import 'package:sketch_flutter_project/core/translations/app_translations.dart';
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
          translations.settings.appereanceHeader,
          style: TextStyles.headerTextStyle(),
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
              translations.settings.system,
              style: TextStyles.bodyTextStyle(),
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
              translations.settings.light,
              style: TextStyles.bodyTextStyle(),
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
              translations.settings.dark,
              style: TextStyles.bodyTextStyle(),
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
              translations.settings.custom,
              style: TextStyles.bodyTextStyle(),
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
