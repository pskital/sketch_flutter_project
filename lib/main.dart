import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/data/dependencies/app_dependencies.dart'
    as dependencies;
import 'package:sketch_flutter_project/logic/language/language_bloc.dart';
import 'package:sketch_flutter_project/logic/theme/theme_bloc.dart';
import 'package:sketch_flutter_project/ui/flutter_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dependencies.init();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => dependencies.serviceLocator<LanguageBloc>()),
    BlocProvider(create: (_) => dependencies.serviceLocator<ThemeBloc>()),
  ], child: const FlutterApp()));
}
