import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';
import 'package:sketch_flutter_project/core/extensions/string_translate_extension.dart';
import 'package:sketch_flutter_project/core/styles/styles.dart';
import 'package:sketch_flutter_project/logic/localization/lang_event.dart';
import 'package:sketch_flutter_project/logic/localization/lang_state.dart';
import 'package:sketch_flutter_project/logic/localization/translation_bloc.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_widget.dart';

class LangSettingsWidget extends BlocWidget<TranslationsBloc, LangState> {
  const LangSettingsWidget({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, TranslationsBloc bloc) {
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
                onChanged: (langType) => bloc.add(SetLanguageEvent(
                      langType: langType,
                    ))),
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
                onChanged: (langType) => bloc.add(SetLanguageEvent(
                      langType: langType,
                    ))),
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
                onChanged: (langType) => bloc.add(SetLanguageEvent(
                      langType: langType,
                    ))),
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
