import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/enums/password_recovery_status.dart';
import 'package:sketch_flutter_project/core/errors/error_handler.dart';
import 'package:sketch_flutter_project/core/errors/error_state.dart';

@immutable
class PasswordRecoveryState with ErrorHandler implements ErrorState {
  factory PasswordRecoveryState() {
    return const PasswordRecoveryState.create(
      status: PasswordRecoveryStatus.idle,
    );
  }

  const PasswordRecoveryState.create({
    required this.status,
    this.error,
  });

  final PasswordRecoveryStatus status;
  final Object? error;

  PasswordRecoveryState copy({
    required PasswordRecoveryStatus status,
    Object? error,
  }) {
    return PasswordRecoveryState.create(
      status: status,
      error: error ?? this.error,
    );
  }

  @override
  Object? getError() {
    return error;
  }

  @override
  String getErrorMessage() {
    return handleError(this);
  }
}
