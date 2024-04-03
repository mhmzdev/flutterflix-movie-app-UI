part of '../configs.dart';

class ThemeModel {
  final Color text;
  final Color textSub;

  final Color background;
  final Color grey;
  final Color darkGrey;
  final Color lightGrey;
  final Color lighterGrey;

  final Color primary;
  final Color primaryDark;

  final Color accent;

  final Color error;
  final Color success;
  final Color warning;

  const ThemeModel({
    required this.text,
    required this.textSub,
    required this.background,
    required this.grey,
    required this.accent,
    required this.darkGrey,
    required this.lightGrey,
    required this.lighterGrey,
    required this.primary,
    required this.primaryDark,
    required this.error,
    required this.warning,
    required this.success,
  });

  ThemeModel copyWith({
    Color? text,
    Color? textSub,
    Color? background,
    Color? grey,
    Color? lightGrey,
    Color? darkGrey,
    Color? ligherGrey,
    Color? accent,
    Color? primary,
    Color? primaryDark,
    Color? error,
    Color? warning,
    Color? success,
  }) {
    return ThemeModel(
      text: text ?? this.text,
      textSub: textSub ?? this.textSub,
      background: background ?? this.background,
      grey: grey ?? this.grey,
      darkGrey: darkGrey ?? this.darkGrey,
      lighterGrey: grey ?? this.lightGrey,
      lightGrey: lightGrey ?? this.lightGrey,
      accent: accent ?? this.accent,
      primary: primary ?? this.primary,
      primaryDark: primaryDark ?? this.primaryDark,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      success: success ?? this.success,
    );
  }
}
