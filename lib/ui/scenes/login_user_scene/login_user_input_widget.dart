import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/styles/text_styles.dart';
import 'package:sketch_flutter_project/core/utils/app_translations.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_bloc.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_widget.dart';

class LoginInputWidget extends BlocWidget<LoginUserBloc, UserLoginState?> {
  @override
  Column buildWidget(BuildContext context, LoginUserBloc bloc) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10),
        Text(
          AppTranslations.get().login.login,
          style: TextStyles.headerTextStyle(),
        ),
        const SizedBox(height: 10),
        TextFormField(
          textInputAction: TextInputAction.next,
          minLines: 1,
          maxLines: 1,
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          validator: bloc.loginFormValidator.emailValidator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: bloc.emailTextController,
        ),
      ],
    );
  }
}
