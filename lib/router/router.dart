import 'package:flutterflix/ui/screens/profile/profile.dart';
import 'package:flutterflix/ui/screens/games/games.dart';
import 'package:flutterflix/ui/screens/news/news.dart';
import 'package:flutterflix/ui/screens/home/home.dart';
import 'package:flutterflix/ui/screens/register/register.dart';
import 'package:flutterflix/ui/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutterflix/ui/screens/splash/splash.dart';

import 'routes.dart';

final appRoutes = {
  AppRoutes.splash: (_) => const SplashScreen(),
  AppRoutes.register: (_) => const RegisterScreen(),
  AppRoutes.login: (_) => const LoginScreen(),
};

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.news:
      return FadeRoute(
        child: const NewsScreen(),
        settings: settings,
      );
    case AppRoutes.home:
      return FadeRoute(
        child: const HomeScreen(),
        settings: settings,
      );
    case AppRoutes.games:
      return FadeRoute(
        child: const GamesScreen(),
        settings: settings,
      );
    case AppRoutes.profile:
      return FadeRoute(
        child: const ProfileScreen(),
        settings: settings,
      );

    default:
      return null;
  }
}

class FadeRoute extends PageRouteBuilder {
  final Widget child;

  @override
  final RouteSettings settings;

  FadeRoute({
    required this.child,
    required this.settings,
  }) : super(
          settings: settings,
          pageBuilder: (context, ani1, ani2) => child,
          transitionsBuilder: (context, ani1, ani2, child) {
            return child;
          },
        );
}
