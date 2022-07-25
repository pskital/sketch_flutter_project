import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/constants/lang_type.dart';
import 'package:sketch_flutter_project/data/providers/localizations_provider.dart';
import 'package:sketch_flutter_project/logic/localizations_bloc.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_provider_widget.dart';

class LangSettingsPage extends BlocProviderWidget<LocalizationsBloc, LangType> {
  const LangSettingsPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, LocalizationsBloc bloc) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text('appLang'.tr()),
          const SizedBox(height: 10),
          Row(
            children: [
              Radio<LangType>(
                  value: LangType.system,
                  groupValue: bloc.state,
                  onChanged: (lang) => bloc.setLang(lang)),
              Text('appLangSystem'.tr()),
            ],
          ),
          Row(
            children: [
              Radio<LangType>(
                  value: LangType.pl,
                  groupValue: bloc.state,
                  onChanged: (lang) => bloc.setLang(lang)),
              const Text('Polski'),
            ],
          ),
          Row(
            children: [
              Radio<LangType>(
                  value: LangType.en,
                  groupValue: bloc.state,
                  onChanged: (lang) => bloc.setLang(lang)),
              const Text('English'),
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
