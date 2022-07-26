import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/theme_type.dart';
import 'package:sketch_flutter_project/core/extensions/string_translate_extension.dart';
import 'package:sketch_flutter_project/core/styles/styles.dart';
import 'package:sketch_flutter_project/logic/theme/theme_bloc.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_provider_widget.dart';

class ThemeSettingsWidget extends BlocProviderWidget<ThemeBloc, ThemeType> {
  const ThemeSettingsWidget({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, ThemeBloc bloc) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            'appAppearance'.tr(),
            style: Styles.headerTextStyle(context),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Radio<ThemeType>(
                  value: ThemeType.system,
                  groupValue: bloc.state,
                  onChanged: (theme) => bloc.setTheme(theme)),
              Text(
                'appAppearanceSystem'.tr(),
                style: Styles.bodyTextStyle(context),
              )
            ],
          ),
          Row(
            children: [
              Radio<ThemeType>(
                  value: ThemeType.light,
                  groupValue: bloc.state,
                  onChanged: (theme) => bloc.setTheme(theme)),
              Text(
                'appAppearanceLight'.tr(),
                style: Styles.bodyTextStyle(context),
              )
            ],
          ),
          Row(
            children: [
              Radio<ThemeType>(
                  value: ThemeType.dark,
                  groupValue: bloc.state,
                  onChanged: (theme) => bloc.setTheme(theme)),
              Text(
                'appAppearanceDark'.tr(),
                style: Styles.bodyTextStyle(context),
              )
            ],
          ),
          Row(
            children: [
              Radio<ThemeType>(
                  value: ThemeType.custom,
                  groupValue: bloc.state,
                  onChanged: (theme) => bloc.setTheme(theme)),
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
      ),
    );
  }
}
