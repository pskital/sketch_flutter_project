import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/route/app_route.dart';
import 'package:sketch_flutter_project/logic/user_login/user_login_state.dart';
import 'package:sketch_flutter_project/ui/snack_bars/custom_snack_bar.dart';

mixin UserLoginStateListener {
  void loginStateListener(BuildContext context, UserLoginState state) {
    if (state is UserLoginErrorState) {
      showSnackBar(context, state.getErrorMessage());
    } else if (state is UserLoginSuccessState) {
      Navigator.of(context).pushNamed(AppRoute.dashboardPage);
    }
  }
}
