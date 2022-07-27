import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/extensions/string_translate_extension.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_bloc.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_event.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_builder_widget.dart';

class LoginUserButtonWidget
    extends BlocBuilderWidget<LoginUserBloc, UserLoginState?> {
  const LoginUserButtonWidget({Key? key}) : super(key: key);

  @override
  buildWidget(BuildContext context, LoginUserBloc bloc, UserLoginState? data) {
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
                onPressed: () => bloc.add(UserLoginEvent()),
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
