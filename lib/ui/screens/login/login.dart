import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterflix/configs/configs.dart';
import 'package:flutterflix/ui/widgets/core/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterflix/ui/widgets/design/button/button.dart';
import 'package:flutterflix/ui/widgets/design/form/text_input/app_email.dart';
import 'package:flutterflix/ui/widgets/design/form/text_input/app_input.dart';
import 'package:flutterflix/ui/widgets/headless/scroll_column_expandable.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

part '_state.dart';

part 'static/_form_data.dart';
part 'static/_form_keys.dart';

part 'widgets/_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
