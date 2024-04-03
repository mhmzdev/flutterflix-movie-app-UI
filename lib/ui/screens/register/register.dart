import 'package:flutterflix/configs/configs.dart';
import 'package:flutterflix/ui/widgets/core/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/foundation.dart';

part '_state.dart';

part 'static/_form_data.dart';
part 'static/_form_keys.dart';

part 'widgets/_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
