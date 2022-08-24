import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/constants/environment_mode.dart';
import 'package:sketch_flutter_project/data/dependencies/configure_dependencies.dart';
import 'package:sketch_flutter_project/logic/language/language_bloc.dart';
import 'package:sketch_flutter_project/logic/theme/theme_bloc.dart';
import 'package:sketch_flutter_project/ui/flutter_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies(EnvironmentMode.prod);

  runApp(
    MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<LanguageBloc>(
            create: (_) => serviceLocator<LanguageBloc>(),),
        BlocProvider<ThemeBloc>(create: (_) => serviceLocator<ThemeBloc>()),
      ],
      child: const FlutterApp(),
    ),
  );
  int d1;
  int d4;
  int d5;
  int d6;
}
