import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/enums/theme_type.dart';
import 'package:sketch_flutter_project/core/route/app_route.dart';
import 'package:sketch_flutter_project/core/themes/dark_theme.dart';
import 'package:sketch_flutter_project/data/repositories/theme_repository.dart';
import 'package:sketch_flutter_project/logic/localization/lang_state.dart';
import 'package:sketch_flutter_project/logic/localization/localizations_bloc.dart';
import 'package:sketch_flutter_project/logic/theme/theme_bloc.dart';

class FlutterApp extends StatefulWidget {
  final ThemeRepository themeRepository;

  const FlutterApp({
    required this.themeRepository,
    Key? key,
  }) : super(key: key);

  @override
  State<FlutterApp> createState() => FlutterAppState();
}

class FlutterAppState extends State<FlutterApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    var themeMode = widget.themeRepository.getThemeMode();
    var themeData = widget.themeRepository.getThemeData();
    return MultiBlocListener(
      listeners: [
        BlocListener<ThemeBloc, ThemeType>(
          listener: (context, state) => _rebuildWidget(),
        ),
        BlocListener<LocalizationsBloc, LangState>(
          listener: (context, state) => _rebuildWidget(),
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
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);
    context.read<LocalizationsBloc>().updateSystemLocales(locales);
  }

  void _rebuildWidget() {
    setState(() {});
  }
}
