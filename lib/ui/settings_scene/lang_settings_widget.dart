import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';
import 'package:sketch_flutter_project/core/extensions/string_translate_extension.dart';
import 'package:sketch_flutter_project/core/styles/styles.dart';
import 'package:sketch_flutter_project/logic/localization/lang_state.dart';
import 'package:sketch_flutter_project/logic/localization/localizations_bloc.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_widget.dart';

class LangSettingsWidget
    extends BlocWidget<LocalizationsBloc, LangState> {
  const LangSettingsWidget({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, LocalizationsBloc bloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          'appLang'.tr(),
          style: Styles.headerTextStyle(context),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Radio<LangType>(
                value: LangType.system,
                groupValue: bloc.state.langType,
                onChanged: (lang) => bloc.setLang(lang)),
            Text(
              'appLangSystem'.tr(),
              style: Styles.bodyTextStyle(context),
            ),
          ],
        ),
        Row(
          children: [
            Radio<LangType>(
                value: LangType.pl,
                groupValue: bloc.state.langType,
                onChanged: (lang) => bloc.setLang(lang)),
            Text(
              'Polski',
              style: Styles.bodyTextStyle(context),
            ),
          ],
        ),
        Row(
          children: [
            Radio<LangType>(
                value: LangType.en,
                groupValue: bloc.state.langType,
                onChanged: (lang) => bloc.setLang(lang)),
            Text(
              'English',
              style: Styles.bodyTextStyle(context),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(height: 1, color: Colors.grey),
        const SizedBox(height: 10),
      ],
    );
  }
}
