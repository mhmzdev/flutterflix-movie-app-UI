import 'package:flutterflix/configs/configs.dart';
import 'package:flutterflix/models/movie/movie.dart';
import 'package:flutterflix/ui/widgets/core/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterflix/ui/widgets/headless/scroll_column_expandable.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

part '_state.dart';

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
