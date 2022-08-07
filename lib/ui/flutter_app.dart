import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/route/app_route.dart';
import 'package:sketch_flutter_project/core/themes/dark_theme.dart';
import 'package:sketch_flutter_project/logic/language/language_bloc.dart';
import 'package:sketch_flutter_project/logic/language/language_event.dart';
import 'package:sketch_flutter_project/logic/redux/app_state.dart';
import 'package:sketch_flutter_project/logic/redux/password_recovery/password_recovery_state.dart';
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
  final Store<AppSate> _store = Store(
    initialState: AppSate(
      passwordRecoveryState: PasswordRecoveryState(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    var languageBloc = getBloc<LanguageBloc>();
    var themeBloc = getBloc<ThemeBloc>();
    return MultiBlocBuilder(
        builder: (context, states) => StoreProvider(
              store: _store,
              child: MaterialApp(
                builder: (context, widget) => MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                  child: widget!,
                ),
                themeMode: themeBloc.getThemeMode(),
                theme: themeBloc.getThemeData(),
                darkTheme: DarkTheme().get(),
                routes: AppRoute().appRoutes,
                initialRoute: AppRoute.loginPage,
              ),
            ),
        blocs: [themeBloc, languageBloc]);
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
}
