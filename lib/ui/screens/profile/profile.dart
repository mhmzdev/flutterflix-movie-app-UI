import 'package:flutterflix/configs/configs.dart';
import 'package:flutterflix/cubits/auth/cubit.dart';
import 'package:flutterflix/router/routes.dart';
import 'package:flutterflix/ui/widgets/core/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterflix/ui/widgets/headless/scroll_column_expandable.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterflix/ui/widgets/design/toast/app_toast.dart';
import 'package:flutterflix/ui/widgets/design/loaders/full_screen.dart';
part '_listener.dart';
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
