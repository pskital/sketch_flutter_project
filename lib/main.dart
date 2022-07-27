import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/data/dependencies/app_dependencies.dart';
import 'package:sketch_flutter_project/ui/flutter_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var appDependencies = AppDependencies();
  await appDependencies.init();

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => appDependencies.createLocalizationBloc()),
        BlocProvider(create: (_) => appDependencies.createThemeBloc()),
      ],
      child: FlutterApp(
        themeRepository: appDependencies.themeRepository,
      )));
}
