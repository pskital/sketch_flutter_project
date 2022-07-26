import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sketch_flutter_project/core/constants/theme_type.dart';
import 'package:sketch_flutter_project/core/themes/dark_theme.dart';
import 'package:sketch_flutter_project/data/providers/localizations_provider.dart';
import 'package:sketch_flutter_project/data/repositories/theme_repository.dart';
import 'package:sketch_flutter_project/logic/localization/lang_state.dart';
import 'package:sketch_flutter_project/logic/localization/localizations_bloc.dart';
import 'package:sketch_flutter_project/logic/theme/theme_bloc.dart';
import 'package:sketch_flutter_project/ui/settings_screen/settings_page.dart';

class SketchFlutterApp extends StatefulWidget {
  final LocalizationsProvider localizationsProvider;
  final ThemeRepository themeRepository;

  const SketchFlutterApp({
    required this.localizationsProvider,
    required this.themeRepository,
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
  late LocalizationsBloc _localizationsBloc;
  UniqueKey _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    var themeMode = widget.themeRepository.getThemeMode();
    var themeData = widget.themeRepository.getThemeData();

    var themeBloc = ThemeBloc(themeRepository: widget.themeRepository);

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => themeBloc),
          BlocProvider(create: (_) => _localizationsBloc),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<ThemeBloc, ThemeType>(
              listener: (context, state) => rebuild(),
            ),
            BlocListener<LocalizationsBloc, LangState>(
              listener: (context, state) => rebuild(),
            ),
          ],
          child: MaterialApp(
            title: 'Flutter Sketch App',
            themeMode: themeMode,
            theme: themeData,
            darkTheme: DarkTheme().get(),
            home: SettingsPage(key: _key),
          ),
        ));
  }

  @override
  void initState() {
    var localizationsProvider = widget.localizationsProvider;
    var localizationsRepository = localizationsProvider.localizationsRepository;
    _localizationsBloc = LocalizationsBloc(
        locationRepository: localizationsRepository,
        localizationsProvider: localizationsProvider);

    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);
    _localizationsBloc.systemLocaleChange(locales);
  }

  void rebuild() {
    setState(() {
      _key = UniqueKey();
    });
  }
}
