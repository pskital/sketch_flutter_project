import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/keys/keys.dart';
import 'package:sketch_flutter_project/core/utils/app_translations.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_bloc.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_event.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_state.dart';

class LoginUserButtonWidget extends StatefulWidget {
  @override
  State<LoginUserButtonWidget> createState() => _LoginUserButtonWidgetState();
}

class _LoginUserButtonWidgetState extends BlocState<LoginUserButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final LoginUserBloc bloc = getBloc<LoginUserBloc>();
    return BlocListener<LoginUserBloc, UserLoginState>(
      listener: (BuildContext context, UserLoginState state) => setState(() {}),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 20),
          Stack(
            fit: StackFit.passthrough,
            children: <Widget>[
              Visibility(
                visible: bloc.state is! UserLoginInProgressState,
                child: ElevatedButton(
                  key: Keys.loginButtonKey,
                  onPressed: bloc.state is UserLoginSuccessState
                      ? null
                      : () => bloc.add(const UserLoginEvent()),
                  child: Text(
                    translations.login.login,
                  ),
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
