import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/lang_type.dart';
import 'package:sketch_flutter_project/core/keys/keys.dart';
import 'package:sketch_flutter_project/core/styles/text_styles.dart';
import 'package:sketch_flutter_project/core/translations/app_translations.dart';
import 'package:sketch_flutter_project/logic/language/language_bloc.dart';
import 'package:sketch_flutter_project/logic/language/language_event.dart';
import 'package:sketch_flutter_project/logic/language/language_state.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_widget.dart';

class SettingsLanguageWidget extends BlocWidget<LanguageBloc, LanguageState> {
  @override
  Widget buildWidget(BuildContext context, LanguageBloc bloc) {
    final LanguageType langType = bloc.state.langType;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10),
        Text(
          translations.settings.language,
          style: TextStyles.headerTextStyle(),
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Radio<LanguageType>(
              value: LanguageType.system,
              groupValue: langType,
              onChanged: (LanguageType? langType) => bloc.add(
                SetLanguageEvent(
                  langType: langType,
                ),
              ),
            ),
            Text(
              translations.settings.system,
              style: TextStyles.bodyTextStyle(),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Radio<LanguageType>(
              key: Keys.langTypePlRadioKey,
              value: LanguageType.pl,
              groupValue: langType,
              onChanged: (LanguageType? langType) => bloc.add(
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
            Radio<LanguageType>(
              key: Keys.langTypeENRadioKey,
              value: LanguageType.en,
              groupValue: langType,
              onChanged: (LanguageType? langType) => bloc.add(
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
