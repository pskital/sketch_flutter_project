import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/constants/paddings.dart';
import 'package:sketch_flutter_project/core/route/app_route.dart';
import 'package:sketch_flutter_project/data/dependencies/app_dependencies.dart'
    as dependencies;
import 'package:sketch_flutter_project/logic/user_login/user_login_bloc.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';
import 'package:sketch_flutter_project/ui/login_user_scene/login_input_widget.dart';
import 'package:sketch_flutter_project/ui/login_user_scene/login_password_input_widget.dart';
import 'package:sketch_flutter_project/ui/login_user_scene/login_user_app_bar_widget.dart';
import 'package:sketch_flutter_project/ui/login_user_scene/login_user_button_widget.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_widget.dart';

class LoginUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => dependencies.serviceLocator<LoginUserBloc>(),
      child: _LoginUserPage(),
    );
  }
}

class _LoginUserPage extends BlocWidget<LoginUserBloc, UserLoginState> {
  @override
  Widget buildWidget(BuildContext context, LoginUserBloc bloc) {
    return Scaffold(
        appBar: AppBarWidget(),
        body: BlocListener<LoginUserBloc, UserLoginState>(
          listener: _loginStateListener,
          child: SafeArea(
            child: Form(
              key: bloc.loginFormValidator.loginFormKey,
              child: ListView(
                padding: const EdgeInsets.all(Paddings.pagePadding),
                children: [
                  LoginInputWidget(),
                  LoginPasswordInputWidget(),
                  LoginUserButtonWidget(),
                ],
              ),
            ),
          ),
        ));
  }

  void _loginStateListener(BuildContext context, UserLoginState state) {
    if (state is UserLoginErrorState) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text(state.getErrorMessage()),
          duration: const Duration(seconds: 2),
        ));
    } else if (state is UserLoginSuccessState) {
      Navigator.of(context).pushNamed(AppRoute.dashboardPage);
    }
  }
}
