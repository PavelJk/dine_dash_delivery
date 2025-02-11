import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: Color(0xffFFE500),
    secondary: Color(0xff121223),
    tertiary: Color(0xff32343E),
    surface: Color(0xffF0F5FA),
  ),
  textTheme: textTheme,
  scaffoldBackgroundColor: Color(0xffffffff),
  
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    primary: Color(0xffFFE500),
    secondary: Color(0xff121223),
    tertiary: Color(0xff32343E),
    surface: Color(0xffF0F5FA),
  ),
  textTheme: textTheme,
  scaffoldBackgroundColor: Colors.black,
);

final TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(

    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      
    ),
    bodySmall: TextStyle(

    ),
    titleMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
    )
);