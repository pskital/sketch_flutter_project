import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/extensions/translation_extension.dart';
import 'package:sketch_flutter_project/core/keys/keys.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_bloc.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_event.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_builder_widget.dart';

class LoginUserButtonWidget
    extends BlocBuilderWidget<LoginUserBloc, UserLoginState> {
  @override
  buildWidget(BuildContext context, LoginUserBloc bloc, UserLoginState data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
        Stack(
          fit: StackFit.passthrough,
          children: [
            Visibility(
              visible: data is! UserLoginInProgressState,
              child: ElevatedButton(
                key: Keys.loginButtonKey,
                onPressed: data is UserLoginSuccessState
                    ? null
                    : () => bloc.add(const UserLoginEvent()),
                child: Text('login'.tr()),
              ),
            ),
            Visibility(
              visible: data is UserLoginInProgressState,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        )
      ],
    );
  }
}
