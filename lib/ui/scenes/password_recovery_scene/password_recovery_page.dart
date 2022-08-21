import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/constants/strings.dart';
import 'package:sketch_flutter_project/core/enums/password_recovery_status.dart';
import 'package:sketch_flutter_project/logic/redux/app_state.dart';
import 'package:sketch_flutter_project/logic/redux/password_recovery/password_recovery_state.dart';
import 'package:sketch_flutter_project/ui/scenes/password_recovery_scene/password_recovery_content_widget.dart';

class PasswordRecoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppSate, PasswordRecoveryViewModel>(
      onDidChange: _handlePasswordRecoveryState,
      vm: () => Factory(this),
      builder: (BuildContext context, PasswordRecoveryViewModel viewModel) =>
          PasswordRecoveryContentWidget(
        viewModel: viewModel,
      ),
    );
  }

  void _handlePasswordRecoveryState(
    BuildContext? context,
    Store<AppSate> store,
    PasswordRecoveryViewModel viewModel,
  ) {
    if (context == null) {
      return;
    }
    switch (viewModel.passwordRecoveryState.status) {
      case PasswordRecoveryStatus.success:
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(Strings.passwordRecoverySuccessMessage),
              duration: const Duration(seconds: 2),
            ),
          );
        break;
      case PasswordRecoveryStatus.error:
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(Strings.recoveryPasswordErrorMessage),
              duration: const Duration(seconds: 2),
            ),
          );
        break;
      default:
        break;
    }
  }
}

class Factory extends VmFactory<AppSate, PasswordRecoveryPage> {
  Factory(PasswordRecoveryPage widget) : super(widget);

  @override
  PasswordRecoveryViewModel fromStore() => PasswordRecoveryViewModel(
        passwordRecoveryState: state.passwordRecoveryState,
      );
}

class PasswordRecoveryViewModel extends Vm {
  PasswordRecoveryViewModel({
    required this.passwordRecoveryState,
  }) : super(equals: <Object?>[passwordRecoveryState]);
  final PasswordRecoveryState passwordRecoveryState;
}
