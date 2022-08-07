import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocState<T extends StatefulWidget> extends State<T> {
  B getBloc<B>() => context.read<B>();
}
