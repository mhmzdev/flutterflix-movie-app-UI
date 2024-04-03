import 'package:flutter/material.dart';
import 'package:flutterflix/configs/configs.dart';
import 'package:flutterflix/cubits/auth/cubit.dart';
import 'package:flutterflix/router/routes.dart';
import 'package:flutterflix/ui/animations/entrance_fader.dart';
import 'package:flutterflix/ui/widgets/core/screen/screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    AuthCubit.c(context).init();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final auth = AuthCubit.c(context, true);
    final failed = auth.state.init is AuthInitFailed;
    final success = auth.state.init is AuthInitSuccess;
    final loading = auth.state.init is AuthInitLoading;

    final didInit = !failed || !success;

    WidgetsBinding.instance.addPostFrameCallback((times) async {
      if (!didInit || !mounted || !loading) return;

      await 2.seconds.delay;

      if (!context.mounted) return;

      final isLoggedIn = auth.state.user != null;
      if (!isLoggedIn) {
        AppRoutes.login.pushReplace(context);
      } else {
        AppRoutes.home.pushReplace(context);
      }
    });

    return Screen(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EntranceFader(
              offset: const Offset(0, 30),
              duration: const Duration(milliseconds: 1500),
              child: FlutterLogo(
                size: 50.un(),
              ),
            ),
            Space.y.t30,
            Text(
              'Flutterflix',
              style: AppText.h2 + FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}
