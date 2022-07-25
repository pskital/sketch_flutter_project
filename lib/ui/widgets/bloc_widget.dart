import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocWidget<T extends StateStreamable<S>, S>
    extends StatelessWidget {
  const BlocWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    T bloc = context.read<T>();
    return BlocBuilder<T, S>(
        builder: (context, data) => buildWidget(context, bloc, data));
  }

  buildWidget(BuildContext context, T bloc, S data);
}
