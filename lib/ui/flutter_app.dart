import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/enums/theme_type.dart';
import 'package:sketch_flutter_project/core/route/app_route.dart';
import 'package:sketch_flutter_project/core/themes/dark_theme.dart';
import 'package:sketch_flutter_project/logic/language/language_bloc.dart';
import 'package:sketch_flutter_project/logic/language/language_event.dart';
import 'package:sketch_flutter_project/logic/language/language_state.dart';
import 'package:sketch_flutter_project/logic/theme/theme_bloc.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_state.dart';

class FlutterApp extends StatefulWidget {
  const FlutterApp({
    Key? key,
  }) : super(key: key);

  @override
  State<FlutterApp> createState() => _FlutterAppState();
}

class _FlutterAppState extends BlocState<FlutterApp, ThemeBloc>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    var themeMode = bloc.getThemeMode();
    var themeData = bloc.getThemeData();
    return MultiBlocListener(
      listeners: [
        BlocListener<ThemeBloc, ThemeType>(
          listener: (context, state) => setState(() {}),
        ),
        BlocListener<LanguageBloc, LanguageState>(
          listener: (context, state) => setState(() {}),
        ),
      ],
      child: MaterialApp(
        themeMode: themeMode,
        theme: themeData,
        darkTheme: DarkTheme().get(),
        routes: AppRoute().appRoutes,
        initialRoute: AppRoute.loginPage,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didUpdateWidget(covariant FlutterApp oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint('didUpdateWidget');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('didChangeDependencies');
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);
    context.read<LanguageBloc>().add(SetSystemLocaleEvent(locales: locales));
  }
}
