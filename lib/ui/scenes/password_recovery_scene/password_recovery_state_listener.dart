import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/password_recovery_status.dart';
import 'package:sketch_flutter_project/core/utils/app_translations.dart';
import 'package:sketch_flutter_project/logic/redux/app_state.dart';
import 'package:sketch_flutter_project/ui/scenes/password_recovery_scene/password_recovery_page.dart';
import 'package:sketch_flutter_project/ui/snack_bars/custom_snack_bar.dart';

mixin PasswordRecoveryStateListener {
  void handlePasswordRecoveryState(
    BuildContext? context,
    Store<AppSate> store,
    PasswordRecoveryViewModel viewModel,
  ) {
    if (context == null) {
      return;
    }
    switch (viewModel.passwordRecoveryState.status) {
      case PasswordRecoveryStatus.success:
        showSnackBar(
          context,
          translations.passwordRecovery.passwordRecoverySuccess,
        );
        break;
      case PasswordRecoveryStatus.error:
        showSnackBar(
          context,
          translations.passwordRecovery.passwordRecoveryError,
        );
        break;
      default:
        break;
    }
  }
}
