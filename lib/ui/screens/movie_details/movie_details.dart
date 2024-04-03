import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterflix/configs/configs.dart';
import 'package:flutterflix/cubits/auth/cubit.dart';
import 'package:flutterflix/models/movie/comment.dart';
import 'package:flutterflix/models/movie/movie.dart';
import 'package:flutterflix/ui/widgets/core/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterflix/ui/widgets/design/cards/comment_card.dart';
import 'package:flutterflix/ui/widgets/design/form/text_input/app_input.dart';
import 'package:flutterflix/ui/widgets/design/toast/app_toast.dart';
import 'package:flutterflix/ui/widgets/headless/scroll_column_expandable.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

part '_state.dart';
part 'static/_form_keys.dart';

part 'widgets/_body.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(args: args),
      child: const _Body(),
    );
  }
}
