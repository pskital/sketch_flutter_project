import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/constants/paddings.dart';
import 'package:sketch_flutter_project/core/dependencies/configure_dependencies.dart';
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
      create: (_) => serviceLocator(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
