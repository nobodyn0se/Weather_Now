import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_themes/app_themes.dart';

import './theme_event.dart';
import './theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(themeData: AppThemeData.themeData[AppThemes.dark]!)) {
    on<ThemeToggled>(_onThemeToggled);
  }

  void _onThemeToggled(ThemeEvent event, Emitter<ThemeState> emit) async {
    if (event is ThemeToggled) {
      state.themeData == AppThemeData.themeData[AppThemes.dark]
          ? emit(
              ThemeState(themeData: AppThemeData.themeData[AppThemes.light]!))
          : emit(
              ThemeState(themeData: AppThemeData.themeData[AppThemes.dark]!));
    }
  }
}
