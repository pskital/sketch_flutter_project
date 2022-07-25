import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sketch_flutter_project/core/constants/lang_type.dart';
import 'package:sketch_flutter_project/core/constants/theme_type.dart';
import 'package:sketch_flutter_project/core/localizations/app_localizations.dart';
import 'package:sketch_flutter_project/core/themes/dark_theme.dart';
import 'package:sketch_flutter_project/data/providers/localizations_provider.dart';
import 'package:sketch_flutter_project/data/repositories/theme_repository.dart';
import 'package:sketch_flutter_project/logic/localizations_bloc.dart';
import 'package:sketch_flutter_project/logic/theme_bloc.dart';
import 'package:sketch_flutter_project/ui/settings_screen/settings_page.dart';

class SketchFlutterApp extends StatefulWidget {
  final AppLocalizationsDelegate localizationsDelegate;
  final ThemeRepository themeRepository;

  const SketchFlutterApp({
    required this.themeRepository,
    required this.localizationsDelegate,
    Key? key,
  }) : super(key: key);

  @override
  State<SketchFlutterApp> createState() => SketchFlutterAppState();

  static SketchFlutterAppState? of(BuildContext context) {
    return context.findAncestorStateOfType<SketchFlutterAppState>();
  }
}

class SketchFlutterAppState extends State<SketchFlutterApp>
    with WidgetsBindingObserver {
  Key key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    var localizationsDelegate = widget.localizationsDelegate;
    var localizationsProvider = localizationsDelegate.localizationsProvider;

    var themeMode = widget.themeRepository.getThemeMode();
    var themeData = widget.themeRepository.getThemeData();

    var themeBloc = ThemeBloc(themeRepository: widget.themeRepository);
    var localizationsBloc = LocalizationsBloc(
        localizationRepository: localizationsProvider.localizationsRepository);
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => themeBloc),
          BlocProvider(create: (_) => localizationsBloc),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<ThemeBloc, ThemeType>(
              listener: (context, state) => rebuild(),
            ),
            BlocListener<LocalizationsBloc, LangType>(
              listener: (context, state) => rebuild(),
            ),
          ],
          child: MaterialApp(
            title: 'Flutter Sketch App',
            themeMode: themeMode,
            theme: themeData,
            supportedLocales: LocalizationsProvider.supportedLocales,
            localizationsDelegates: <LocalizationsDelegate<dynamic>>[
              localizationsDelegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
            ],
            darkTheme: DarkTheme().get(),
            home: SettingsPage(key: key),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeLocales(List<Locale>? locales) async {
    widget.localizationsDelegate.localizationsProvider.systemLocale =
        locales?.first;
    await widget.localizationsDelegate.localizationsProvider.loadTranslations();
    super.didChangeLocales(locales);
    rebuild();
  }

  void rebuild() {
    setState(() {
      key = UniqueKey();
    });
  }
}
