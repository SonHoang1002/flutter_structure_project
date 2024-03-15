import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_structure_project/commons/themes.dart';
import 'package:flutter_structure_project/providers/blocs/theme_bloc.dart';
import 'package:flutter_structure_project/providers/states/theme_state.dart';
import 'package:flutter_structure_project/screens/welcome.dart';

class MaterialWithTheme extends StatefulWidget {
  const MaterialWithTheme({
    super.key,
  });

  @override
  State<MaterialWithTheme> createState() => _MaterialWithThemeState();
}

class _MaterialWithThemeState extends State<MaterialWithTheme> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget homeWidget = const WelcomePage();
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, theme) {
      return MaterialApp(
        title: 'Structure Project',
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        themeMode: theme.themeMode,
        home: homeWidget,
      );
    });
  }
}
