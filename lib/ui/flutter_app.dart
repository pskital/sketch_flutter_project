import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/route/app_route.dart';
import 'package:sketch_flutter_project/core/themes/dark_theme.dart';
import 'package:sketch_flutter_project/logic/language/language_bloc.dart';
import 'package:sketch_flutter_project/logic/language/language_event.dart';
import 'package:sketch_flutter_project/logic/theme/theme_bloc.dart';
import 'package:sketch_flutter_project/ui/widgets/bloc_state.dart';
import 'package:sketch_flutter_project/ui/widgets/multi_bloc_builder.dart';

class FlutterApp extends StatefulWidget {
  const FlutterApp({
    Key? key,
  }) : super(key: key);

  @override
  State<FlutterApp> createState() => _FlutterAppState();
}

class _FlutterAppState extends BlocState<FlutterApp>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    final LanguageBloc languageBloc = getBloc<LanguageBloc>();
    final ThemeBloc themeBloc = getBloc<ThemeBloc>();
    return MultiBlocBuilder(
      builder: (BuildContext context, BlocStates states) => MaterialApp(
        builder: (BuildContext context, Widget? widget) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: widget!,
        ),
        themeMode: themeBloc.getThemeMode(),
        theme: themeBloc.getThemeData(),
        darkTheme: DarkTheme().get(),
        routes: AppRoute().appRoutes,
        initialRoute: AppRoute.loginPage,
      ),
      blocs: <Bloc<dynamic, dynamic>>[themeBloc, languageBloc],
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
    context.read<LanguageBloc>().add(UpdateSystemLocaleEvent(locales: locales));
  }
}
