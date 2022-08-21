import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/logic/redux/app_state.dart';
import 'package:sketch_flutter_project/logic/redux/password_recovery/password_recovery_state.dart';
import 'package:sketch_flutter_project/ui/scenes/password_recovery_scene/password_recovery_content_widget.dart';
import 'package:sketch_flutter_project/ui/scenes/password_recovery_scene/password_recovery_state_listener.dart';

class PasswordRecoveryPage extends StatelessWidget
    with PasswordRecoveryStateListener {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppSate, PasswordRecoveryViewModel>(
      onDidChange: handlePasswordRecoveryState,
      vm: () => Factory(this),
      builder: (BuildContext context, PasswordRecoveryViewModel viewModel) =>
          PasswordRecoveryContentWidget(
        viewModel: viewModel,
      ),
    );
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
