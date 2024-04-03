import 'package:flutterflix/configs/configs.dart';
import 'package:flutterflix/ui/widgets/core/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part '_state.dart';

part 'widgets/_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
