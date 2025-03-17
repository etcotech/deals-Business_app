import 'package:flutter/material.dart';

ThemeData light({Color? primaryColor, Color? secondaryColor})=> ThemeData(
  fontFamily: 'Cairo',
  primaryColor: const Color(0xFFfbbe12),
  brightness: Brightness.light,
  highlightColor: Colors.white,
  hintColor: const Color(0xFF9E9E9E),

  splashColor: Colors.transparent,
  colorScheme:  ColorScheme.light(
    primary: const Color(0xFF5F2020),
    secondary: const Color(0xFFA7522D),
    tertiary: const Color(0xFFF9D4A8),
    tertiaryContainer: const Color(0xFFADC9F3),
    onTertiaryContainer: const Color(0xFF33AF74),
    onPrimary: const Color.fromARGB(255, 255, 255, 255),
    surface: const Color(0xFFF4F8FF),
    onSecondary: secondaryColor ?? const Color(0xFFF88030),
    error: const Color(0xFFFF5555),
    onSecondaryContainer: const Color(0xFFF3F9FF),
    outline: const Color(0xff2C66B4),
    onTertiary: const Color(0xFFE9F3FF),


    primaryContainer: const Color(0xFF9AECC6),secondaryContainer: const Color(0xFFF2F2F2),),

  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),

  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
    labelSmall: TextStyle(fontSize: 12, color: Colors.grey),
  ),
);