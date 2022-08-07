import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/extensions/translation_extension.dart';
import 'package:sketch_flutter_project/core/styles/styles.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_bloc.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_widget.dart';

class LoginPasswordInputWidget
    extends BlocWidget<LoginUserBloc, UserLoginState> {

  @override
  buildWidget(BuildContext context, LoginUserBloc bloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          'password'.tr(),
          style: Styles.headerTextStyle(context),
        ),
        const SizedBox(height: 10),
        TextFormField(
          textInputAction: TextInputAction.done,
          minLines: 1,
          maxLines: 1,
          autocorrect: false,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          validator: bloc.loginFormValidator.passwordValidator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: bloc.passwordTextController,
        ),
      ],
    );
  }
}
