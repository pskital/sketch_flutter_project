import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/constants/paddings.dart';
import 'package:sketch_flutter_project/core/form_validation/password_recovery_form_validator.dart';
import 'package:sketch_flutter_project/core/styles/text_styles.dart';
import 'package:sketch_flutter_project/core/utils/app_translations.dart';
import 'package:sketch_flutter_project/logic/redux/app_state.dart';
import 'package:sketch_flutter_project/logic/redux/password_recovery/password_recovery_action.dart';

class PasswordRecoveryFormWidget extends StatelessWidget {
  final PasswordRecoveryValidator _passwordRecoveryValidator =
      PasswordRecoveryValidator();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Form build(BuildContext context) {
    return Form(
      key: _passwordRecoveryValidator.formKey,
      child: ListView(
        padding: const EdgeInsets.all(Paddings.pagePadding),
        shrinkWrap: true,
        children: <Widget>[
          const SizedBox(height: 10),
          Text(
            translations.passwordRecovery.email,
            style: TextStyles.headerTextStyle(),
          ),
          const SizedBox(height: 10),
          TextFormField(
            textInputAction: TextInputAction.next,
            minLines: 1,
            maxLines: 1,
            autocorrect: false,
            validator: _passwordRecoveryValidator.emailValidator,
            keyboardType: TextInputType.emailAddress,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _textEditingController,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _recoveryPassword(context),
            child: Text(
              translations.passwordRecovery.sendButton,
            ),
          )
        ],
      ),
    );
  }

  void _recoveryPassword(BuildContext context) {
    if (!_passwordRecoveryValidator.isFormValid()) {
      return;
    }

    StoreProvider.dispatch<AppSate>(
      context,
      PasswordRecoveryAction(_textEditingController.text),
    );
  }
}