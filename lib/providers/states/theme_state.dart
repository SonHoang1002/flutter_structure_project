
import 'package:flutter/material.dart';

abstract class ThemeState {
  final ThemeMode themeMode;
  ThemeState(this.themeMode);
}

class InitThemeState extends ThemeState {
  InitThemeState() : super(ThemeMode.system);
}

class UpdateThemeState extends ThemeState {
  final ThemeMode themeMode;
  UpdateThemeState(this.themeMode) : super(themeMode);
}
