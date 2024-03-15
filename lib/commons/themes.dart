import 'package:flutter/material.dart';
import 'package:flutter_structure_project/commons/colors.dart';
 
                 
class MyThemes {
  static final lightTheme = ThemeData(
    bottomAppBarTheme: const BottomAppBarTheme(color: blockLight),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: black005,
    ),
    // input back ground
    scaffoldBackgroundColor: const Color.fromRGBO(245, 246, 254, 1),
    badgeTheme: const BadgeThemeData(backgroundColor: black005),
    sliderTheme: const SliderThemeData(inactiveTrackColor: black01),
    // step rectangle home color
    searchViewTheme: const SearchViewThemeData(backgroundColor: black015),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: black),
      displayMedium: TextStyle(color: black05),
      bodySmall: TextStyle(color: black),
      titleLarge: TextStyle(color: white),
    ), 
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith(
                (states) => const TextStyle(color: white)))),
    dividerTheme: DividerThemeData(color: Colors.grey.shade300),
    dialogBackgroundColor: whiteLight,
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color.fromRGBO(245, 250, 255, 1)),
  );
  static final darkTheme = ThemeData(
    bottomAppBarTheme: const BottomAppBarTheme(color: blockDark),
    scaffoldBackgroundColor: const Color.fromRGBO(34, 34, 37, 1),
    badgeTheme: const BadgeThemeData(backgroundColor: white005),
    sliderTheme: const SliderThemeData(inactiveTrackColor: white01),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: white005
    ),
    // step rectangle home color
    searchViewTheme: const SearchViewThemeData(backgroundColor: white015),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: white),
      displayMedium: TextStyle(color: white05),
      bodySmall: TextStyle(color: white),
      titleLarge: TextStyle(color: black),
    ), 
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith(
                (states) => const TextStyle(color: white)))),
    dividerTheme: DividerThemeData(color: Colors.grey.shade800),
    dialogBackgroundColor: greyDark2,
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color.fromRGBO(35, 35, 35, 1)),
  );
}
