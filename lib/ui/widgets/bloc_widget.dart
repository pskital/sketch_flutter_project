import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocWidget<T extends StateStreamable<S>, S>
    extends StatelessWidget {
  const BlocWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildWidget(context, _getBloc(context));
  }

  T _getBloc(BuildContext context) => context.read<T>();

  B getBloc<B>(BuildContext context) => context.read<B>();

  buildWidget(BuildContext context, T bloc);
}
