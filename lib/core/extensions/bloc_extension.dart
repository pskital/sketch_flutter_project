import 'package:flutter_bloc/flutter_bloc.dart';

extension ListenWithCurrent<State, Event> on BlocBase<State> {
  listenWithCurrent<B extends BlocBase<State>>(
      B bloc, void Function(State) onData) {
    onData(bloc.state);
    bloc.stream.listen(onData);
  }
}

class CustomBlocStateListener {
  var _isRegistered = false;

  void registerListener<B extends BlocBase<State>, State>(
      B bloc, Function() onStateChange) {
    if (_isRegistered) {
      return;
    }

    bloc.listenWithCurrent(bloc, (state) {
      onStateChange();
    });

    _isRegistered = true;
  }
}
