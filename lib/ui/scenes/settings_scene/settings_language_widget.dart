import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';
import 'package:sketch_flutter_project/core/keys/keys.dart';
import 'package:sketch_flutter_project/core/styles/text_styles.dart';
import 'package:sketch_flutter_project/core/utils/app_translations.dart';
import 'package:sketch_flutter_project/logic/language/language_bloc.dart';
import 'package:sketch_flutter_project/logic/language/language_event.dart';
import 'package:sketch_flutter_project/logic/language/language_state.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_widget.dart';

class SettingsLanguageWidget extends BlocWidget<LanguageBloc, LanguageState> {
  @override
  Widget buildWidget(BuildContext context, LanguageBloc bloc) {
    final LangType langType = bloc.state.langType;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10),
        Text(
          AppTranslations.get().settings.language,
          style: TextStyles.headerTextStyle(),
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Radio<LangType>(
              value: LangType.system,
              groupValue: langType,
              onChanged: (LangType? langType) => bloc.add(
                SetLanguageEvent(
                  langType: langType,
                ),
              ),
            ),
            Text(
              AppTranslations.get().settings.system,
              style: TextStyles.bodyTextStyle(),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Radio<LangType>(
              key: Keys.langTypePlRadioKey,
              value: LangType.pl,
              groupValue: langType,
              onChanged: (LangType? langType) => bloc.add(
                SetLanguageEvent(
                  langType: langType,
                ),
              ),
            ),
            Text(
              'Polski',
              style: TextStyles.bodyTextStyle(),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Radio<LangType>(
              key: Keys.langTypeENRadioKey,
              value: LangType.en,
              groupValue: langType,
              onChanged: (LangType? langType) => bloc.add(
                SetLanguageEvent(
                  langType: langType,
                ),
              ),
            ),
            Text(
              'English',
              style: TextStyles.bodyTextStyle(),
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
