import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflix/router/router.dart';
import 'package:flutterflix/router/routes.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';
import 'package:provider/provider.dart';

import 'base_wrapper.dart';
import 'configs/configs.dart';

// bloc-imports-start
import 'cubits/auth/cubit.dart';
// bloc-imports-end

// provider-imports-start
import 'firebase_options.dart';
import 'providers/app.dart';
// provider-imports-end

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// @Important: This has been commented, can be used if emulators are configured
  // if (kDebugMode) {
  //   FirebaseAuth.instance.useAuthEmulator('localhost', 6060);
  //   FirebaseFirestore.instance.useFirestoreEmulator('localhost', 7070);
  //   FirebaseStorage.instance.useStorageEmulator('localhost', 8080);
  // }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigator = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // provider-initiate-start
        ChangeNotifierProvider(create: (_) => AppState()),
        // provider-initiate-end

        // bloc-initiate-start
        BlocProvider(create: (_) => AuthCubit()),
        // bloc-initiate-end
      ],
      child: MaterialApp(
        navigatorKey: navigator,
        debugShowCheckedModeBanner: false,
        title: 'Flutterflix',
        navigatorObservers: [
          NavigationHistoryObserver(),
        ],
        themeMode: ThemeMode.dark,
        theme: materialLightTheme,
        darkTheme: materialDarkTheme,
        initialRoute: AppRoutes.splash,
        routes: appRoutes,
        onGenerateRoute: onGenerateRoutes,
        builder: (context, child) => BaseWrapper(
          child: child!,
        ),
      ),
    );
  }
}
