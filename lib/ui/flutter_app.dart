import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/enums/theme_type.dart';
import 'package:sketch_flutter_project/core/route/app_route.dart';
import 'package:sketch_flutter_project/core/themes/dark_theme.dart';
import 'package:sketch_flutter_project/logic/localization/language_bloc.dart';
import 'package:sketch_flutter_project/logic/localization/language_event.dart';
import 'package:sketch_flutter_project/logic/localization/language_state.dart';
import 'package:sketch_flutter_project/logic/theme/theme_bloc.dart';

class FlutterApp extends StatefulWidget {
  const FlutterApp({
    Key? key,
  }) : super(key: key);

  @override
  State<FlutterApp> createState() => FlutterAppState();
}

class FlutterAppState extends State<FlutterApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    var themeBloc = context.read<ThemeBloc>();
    var themeMode = themeBloc.getThemeMode();
    var themeData = themeBloc.getThemeData();
    return MultiBlocListener(
      listeners: [
        BlocListener<ThemeBloc, ThemeType>(
          listener: (context, state) => _rebuildWidget(),
        ),
        BlocListener<LanguageBloc, LanguageState>(
          listener: (context, state) => _rebuildWidget(),
        ),
      ],
      child: _buildMaterialApp(themeMode, themeData),
    );
  }

  MaterialApp _buildMaterialApp(ThemeMode themeMode, ThemeData themeData) {
    return MaterialApp(
      themeMode: themeMode,
      theme: themeData,
      darkTheme: DarkTheme().get(),
      routes: AppRoute().appRoutes,
      initialRoute: AppRoute.loginPage,
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);
    context.read<LanguageBloc>().add(SetSystemLocaleEvent(locales: locales));
  }

  void _rebuildWidget() {
    setState(() {});
  }
}
