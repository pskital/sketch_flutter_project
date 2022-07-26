import 'package:bloc/bloc.dart';
import 'package:sketch_flutter_project/core/enums/theme_type.dart';
import 'package:sketch_flutter_project/data/repositories/theme_repository.dart';

class ThemeBloc extends BlocBase<ThemeType> {
  final ThemeRepository themeRepository;

  ThemeBloc({required this.themeRepository}) : super(themeRepository.themeType);

  void setTheme(ThemeType? theme) async {
    if (theme != null) {
      await themeRepository.setTheme(theme);
      emit(theme);
    }
  }
}
