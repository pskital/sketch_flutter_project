import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/constants/paddings.dart';
import 'package:sketch_flutter_project/data/dependencies/login_page_dependencies.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_bloc.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';
import 'package:sketch_flutter_project/ui/login_user_scene/login_input_widget.dart';
import 'package:sketch_flutter_project/ui/login_user_scene/login_password_input_widget.dart';
import 'package:sketch_flutter_project/ui/login_user_scene/login_user_app_bar_widget.dart';
import 'package:sketch_flutter_project/ui/login_user_scene/login_user_button_widget.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_widget.dart';

class LoginUserPage extends StatelessWidget with LoginPageDependencies {
  LoginUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => createLoginUserBloc(),
      child: _LoginUserPage(),
    );
  }
}

class _LoginUserPage extends BlocWidget<LoginUserBloc, UserLoginState?> {
  @override
  Widget buildWidget(BuildContext context, LoginUserBloc bloc) {
    return Scaffold(
        appBar: const AppBarWidget(),
        body: BlocListener<LoginUserBloc, UserLoginState?>(
          listener: _loginStateListener,
          child: SafeArea(
            child: Form(
              key: bloc.loginFormValidator.loginFormKey,
              child: ListView(
                padding: const EdgeInsets.all(Paddings.pagePadding),
                children: const [
                  LoginInputWidget(),
                  LoginPasswordInputWidget(),
                  LoginUserButtonWidget(),
                ],
              ),
            ),
          ),
        ));
  }

  void _loginStateListener(BuildContext context, UserLoginState? state) {
    if (state != null && state is UserLoginErrorState) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(state.errorMessage),
          duration: const Duration(seconds: 2),
        ));
    }
  }
}
