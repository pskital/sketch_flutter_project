import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/password_recovery_status.dart';
import 'package:sketch_flutter_project/core/utils/app_translations.dart';
import 'package:sketch_flutter_project/ui/scenes/password_recovery_scene/password_recovery_form_widget.dart';
import 'package:sketch_flutter_project/ui/scenes/password_recovery_scene/password_recovery_page.dart';

class PasswordRecoveryContentWidget extends StatelessWidget {
  const PasswordRecoveryContentWidget({required this.viewModel});

  final PasswordRecoveryViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppTranslations.get().passwordRecovery.pageTitle,
        ),
      ),
      body: Center(
        child: PasswordRecoveryStatusWidget(
          passwordRecoveryStatus: viewModel.passwordRecoveryState.status,
          inProgressWidget: const CircularProgressIndicator(),
          idleWidget: PasswordRecoveryFormWidget(),
        ),
      ),
    );
  }
}

class PasswordRecoveryStatusWidget extends StatelessWidget {
  const PasswordRecoveryStatusWidget({
    required this.passwordRecoveryStatus,
    required this.inProgressWidget,
    required this.idleWidget,
  });

  final PasswordRecoveryStatus passwordRecoveryStatus;
  final Widget inProgressWidget;
  final Widget idleWidget;

  @override
  Widget build(BuildContext context) {
    if (passwordRecoveryStatus == PasswordRecoveryStatus.inProgress) {
      return inProgressWidget;
    } else {
      return idleWidget;
    }
  }
}
