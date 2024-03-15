 import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure_project/providers/events/theme_event.dart';
import 'package:flutter_structure_project/providers/states/theme_state.dart';
 
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(InitThemeState()) {
    on<UpdateThemeEvent>((event, emit) {
      ThemeMode currentThemeMode = state.themeMode;
      ThemeMode newThemeMode = currentThemeMode;
      switch (currentThemeMode) {
        case ThemeMode.system:
          if (ThemeMode.system == ThemeMode.dark) {
            newThemeMode = ThemeMode.light;
          } else {
            newThemeMode = ThemeMode.dark;
          }
          break;
        case ThemeMode.dark:
          newThemeMode = ThemeMode.light;
          break;
        case ThemeMode.light:
          newThemeMode = ThemeMode.dark;
          break;
        default:
          break;
      }
      emit(UpdateThemeState(newThemeMode));
    });
  }

  bool get isDarkMode {
    if (state.themeMode == ThemeMode.system) {
      // ignore: deprecated_member_use
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return state.themeMode == ThemeMode.dark;
    }
  }

}
