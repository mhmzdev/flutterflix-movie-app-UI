part of '../configs.dart';

class AppTheme {
  static late ThemeModel c;

  static void init(BuildContext context) {
    c = Theme.of(context).brightness == Brightness.light
        ? _lightTheme
        : _darkTheme;
  }
}
