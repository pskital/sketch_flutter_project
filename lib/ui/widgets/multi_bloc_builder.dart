import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class MultiBlocBuilder extends StatefulWidget {
  const MultiBlocBuilder({
    required Widget Function(BuildContext, BlocStates) builder,
    required List<Bloc<dynamic, dynamic>> blocs,
  })  : _builder = builder,
        _blocs = blocs;
  final Widget Function(BuildContext, BlocStates) _builder;
  final List<Bloc<dynamic, dynamic>> _blocs;

  @override
  State<StatefulWidget> createState() => _MultiBlocState();
}

class _MultiBlocState extends State<MultiBlocBuilder> {
  final List<StreamSubscription<dynamic>> _stateSubscriptions =
      <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    super.initState();

    for (final Bloc<dynamic, dynamic> bloc in widget._blocs) {
      final StreamSubscription<dynamic> subscription =
          bloc.stream.listen((dynamic state) => setState(() {}));
      _stateSubscriptions.add(subscription);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> states =
        widget._blocs.map((Bloc<dynamic, dynamic> bloc) => bloc.state).toList();
    return widget._builder(context, BlocStates._private(states));
  }

  @override
  void dispose() {
    super.dispose();
    for (final StreamSubscription<dynamic> subscription
        in _stateSubscriptions) {
      subscription.cancel();
    }
  }
}

class BlocStates {
  BlocStates._private(List<dynamic> states) {
    _stateContainer.addAll(states);
  }

  final List<dynamic> _stateContainer = <dynamic>[];

  T get<T>() => _stateContainer.firstWhere(
        (dynamic entry) => entry is T,
        orElse: () => null,
      );
}
