import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/constants/paddings.dart';
import 'package:sketch_flutter_project/core/constants/strings.dart';
import 'package:sketch_flutter_project/core/route/app_route.dart';
import 'package:sketch_flutter_project/core/styles/styles.dart';
import 'package:sketch_flutter_project/data/dependencies/configure_dependencies.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_bloc.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';
import 'package:sketch_flutter_project/ui/scenes/login_user_scene/login_user_app_bar_widget.dart';
import 'package:sketch_flutter_project/ui/scenes/login_user_scene/login_user_button_widget.dart';
import 'package:sketch_flutter_project/ui/scenes/login_user_scene/login_user_input_widget.dart';
import 'package:sketch_flutter_project/ui/scenes/login_user_scene/login_user_password_input_widget.dart';
import 'package:sketch_flutter_project/ui/scenes/login_user_scene/login_user_state_listener.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_widget.dart';

class LoginUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginUserBloc>(
      create: (_) => serviceLocator<LoginUserBloc>(),
      child: LoginUserWidget(),
    );
  }
}

class LoginUserWidget extends BlocWidget<LoginUserBloc, UserLoginState>
    with UserLoginStateListener {
  @override
  Widget buildWidget(BuildContext context, LoginUserBloc bloc) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: BlocListener<LoginUserBloc, UserLoginState>(
        listener: loginStateListener,
        child: SafeArea(
          child: Form(
            key: bloc.loginFormValidator.formKey,
            child: ListView(
              padding: const EdgeInsets.all(Paddings.pagePadding),
              children: <Widget>[
                LoginInputWidget(),
                LoginPasswordInputWidget(),
                LoginUserButtonWidget(),
                PasswordRecoveryWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PasswordRecoveryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 40),
        GestureDetector(
          onTap: () =>
              Navigator.of(context).pushNamed(AppRoute.passwordRecovery),
          child: Text(
            Strings.passwordRecovery,
            style: Styles.bodyTextStyle(context),
          ),
        ),
      ],
    );
  }
}
