import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocProviderWidget<T extends StateStreamable<S>, S>
    extends StatelessWidget {
  const BlocProviderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    T bloc = context.read<T>();
    return buildWidget(context, bloc);
  }

  buildWidget(BuildContext context, T bloc);
}
