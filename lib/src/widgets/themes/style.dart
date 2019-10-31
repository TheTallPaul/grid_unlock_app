import 'package:flutter/material.dart';

ThemeData primaryTheme() {
  const Color primaryColor = Color(0xFF558B2F);
  const Color secondaryColor  = Color(0xFF7CB342);
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor ,
  );
  final buttonTheme = ButtonThemeData(
    colorScheme: colorScheme,
    textTheme: ButtonTextTheme.primary,
  );

  return ThemeData(
    colorScheme: colorScheme,
    brightness: Brightness.light,
    accentColorBrightness: Brightness.dark,
    primaryColor: primaryColor,
    buttonColor: primaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: const Color(0xFF1E88E5),
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    accentColor: secondaryColor,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    errorColor: const Color(0xFFB00020),
    buttonTheme: buttonTheme,
  );
}

ThemeData nightTheme(){
  return ThemeData(
    primaryColor:  Colors.black
  );
}