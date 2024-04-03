part of 'configs.dart';

abstract class AppProps {
  static final quick = 100.milliseconds;
  static final fast = 200.milliseconds;
  static final medium = 300.milliseconds;
  static final normal = 500.milliseconds;

  static final top6Dec = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(6.un()),
    ),
  );

  static final softShadow = [
    BoxShadow(
      color: AppTheme.c.lightGrey,
      blurRadius: 10,
    ),
  ];

  static final card = BoxDecoration(
    borderRadius: 6.radius(),
    boxShadow: [
      BoxShadow(
        color: AppTheme.c.lightGrey,
        blurRadius: 10,
      ),
    ],
  );
}
