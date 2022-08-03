import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/extensions/translation_extension.dart';
import 'package:sketch_flutter_project/core/keys/keys.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_bloc.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_event.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_state.dart';

class LoginUserButtonWidget extends StatefulWidget {
  @override
  State<LoginUserButtonWidget> createState() => _LoginUserButtonWidgetState();
}

class _LoginUserButtonWidgetState
    extends BlocState<LoginUserButtonWidget, LoginUserBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginUserBloc, UserLoginState>(
      listener: (context, state) => setState(() {}),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Stack(
            fit: StackFit.passthrough,
            children: [
              Visibility(
                visible: bloc.state is! UserLoginInProgressState,
                child: ElevatedButton(
                  key: Keys.loginButtonKey,
                  onPressed: () => bloc.add(const UserLoginEvent()),
                  child: Text('login'.tr()),
                ),
              ),
              Visibility(
                visible: bloc.state is UserLoginInProgressState,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
