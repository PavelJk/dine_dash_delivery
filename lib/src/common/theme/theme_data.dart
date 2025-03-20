import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: Color(0xff32343E),
    onPrimary: Color(0xff676767),
    secondary: Color(0xff121223),
    onSecondary: Color(0xfff6f6f6),
    tertiary: Color(0xffFFE500),
    onTertiary: Color(0xffECF0F4),
    surface: Color(0xffF0F5FA),
    onSurface: Colors.black,
    inversePrimary: Color(0xffffffff),
  ),
  textTheme: GoogleFonts.senTextTheme(textTheme),
  scaffoldBackgroundColor: Color(0xffffffff),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xffffffff),
  )
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    primary: Color(0xffFFE500),
    secondary: Color(0xff121223),
    tertiary: Color(0xff32343E),
    surface: Color(0xffF0F5FA),
  ),
  textTheme: GoogleFonts.senTextTheme(textTheme),
  scaffoldBackgroundColor: Colors.black,
);

final TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white
    ),
    headlineMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white.withValues(alpha: 85),
      height: 1.6,
    ),
    headlineSmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(

    ),
    titleMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.3,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    labelSmall: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
);