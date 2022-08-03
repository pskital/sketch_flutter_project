import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocState<T extends StatefulWidget, B> extends State<T> {
  B get bloc => context.read<B>();
}
