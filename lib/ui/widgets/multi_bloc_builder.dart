import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class MultiBlocBuilder extends StatefulWidget {
  final Widget Function(BuildContext, BlocStates) _builder;
  final List<Bloc> _blocs;

  const MultiBlocBuilder({
    required Widget Function(BuildContext, BlocStates) builder,
    required List<Bloc> blocs,
  })  : _builder = builder,
        _blocs = blocs;

  @override
  State<StatefulWidget> createState() => _MultiBlocState();
}

class _MultiBlocState extends State<MultiBlocBuilder> {
  final _stateSubscriptions = [];

  @override
  void initState() {
    super.initState();

    for (var bloc in widget._blocs) {
      final subscription = bloc.stream.listen((state) => setState(() {}));
      _stateSubscriptions.add(subscription);
    }
  }

  @override
  Widget build(BuildContext context) {
    final states = widget._blocs.map((bloc) => bloc.state).toList();
    return widget._builder(context, BlocStates._private(states));
  }

  @override
  void dispose() {
    super.dispose();
    for (var subscription in _stateSubscriptions) {
      subscription.cancel();
    }
  }
}

class BlocStates {
  final List _stateContainer = [];

  BlocStates._private(List states) {
    _stateContainer.addAll(states);
  }

  T get<T>() =>
      _stateContainer.firstWhere((entry) => (entry is T), orElse: () => null);
}
