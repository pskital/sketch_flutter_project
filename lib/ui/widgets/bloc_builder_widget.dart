import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocBuilderWidget<T extends StateStreamable<S>, S>
    extends StatelessWidget {
  const BlocBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final T bloc = context.read<T>();
    return BlocBuilder<T, S>(
      builder: (BuildContext context, S data) => buildWidget(
        context,
        bloc,
        data,
      ),
    );
  }

  Widget buildWidget(BuildContext context, T bloc, S data);
}
