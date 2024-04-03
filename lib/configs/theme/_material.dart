part of '../configs.dart';

final materialLightTheme = ThemeData(
  fontFamily: 'Poppins',
  brightness: Brightness.light,
  useMaterial3: false,
  primaryColor: _lightTheme.primary,
  primaryColorDark: _lightTheme.primary,
  colorScheme: ColorScheme.light(
    primary: _lightTheme.primary,
    secondary: _lightTheme.primary,
    surface: _lightTheme.background,
    background: _lightTheme.background,
    error: _lightTheme.error,
    onPrimary: _lightTheme.primary,
    onSecondary: _lightTheme.text,
    onSurface: _lightTheme.text,
    onBackground: _lightTheme.text,
    onError: _lightTheme.text,
  ),
  highlightColor: _lightTheme.text.withOpacity(0.1),
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: _lightTheme.background,
  textTheme: (const TextTheme()).apply(
    bodyColor: _lightTheme.text,
    displayColor: _lightTheme.text,
    decorationColor: _lightTheme.text,
    fontFamily: 'Poppins',
  ),
);

final materialDarkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: false,
  primaryColor: _darkTheme.primary,
  primaryColorDark: _darkTheme.primaryDark,
  fontFamily: 'Poppins',
  colorScheme: ColorScheme.dark(
    primary: _darkTheme.primary,
    secondary: _darkTheme.primary,
    surface: _darkTheme.background,
    background: _darkTheme.background,
    error: _darkTheme.error,
    onPrimary: _darkTheme.primaryDark,
    onSecondary: _darkTheme.text,
    onSurface: _darkTheme.text,
    onBackground: _darkTheme.text,
    onError: _darkTheme.text,
  ),
  highlightColor: _darkTheme.text.withOpacity(0.1),
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: _darkTheme.background,
  textTheme: (const TextTheme()).apply(
    bodyColor: _darkTheme.text,
    displayColor: _darkTheme.text,
    decorationColor: _darkTheme.text,
    fontFamily: 'Poppins',
  ),
);
