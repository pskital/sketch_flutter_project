import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/constants/theme_type.dart';
import 'package:sketch_flutter_project/data/providers/localizations_provider.dart';
import 'package:sketch_flutter_project/logic/theme_bloc.dart';
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
          Text('appAppearance'.tr()),
          const SizedBox(height: 10),
          Row(
            children: [
              Radio<ThemeType>(
                  value: ThemeType.system,
                  groupValue: bloc.state,
                  onChanged: (theme) => bloc.setTheme(theme)),
              Text('appAppearanceSystem'.tr()),
            ],
          ),
          Row(
            children: [
              Radio<ThemeType>(
                  value: ThemeType.light,
                  groupValue: bloc.state,
                  onChanged: (theme) => bloc.setTheme(theme)),
              Text('appAppearanceLight'.tr()),
            ],
          ),
          Row(
            children: [
              Radio<ThemeType>(
                  value: ThemeType.dark,
                  groupValue: bloc.state,
                  onChanged: (theme) => bloc.setTheme(theme)),
              Text('appAppearanceDark'.tr()),
            ],
          ),
          Row(
            children: [
              Radio<ThemeType>(
                  value: ThemeType.custom,
                  groupValue: bloc.state,
                  onChanged: (theme) => bloc.setTheme(theme)),
              Text('appAppearanceCustom'.tr()),
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
