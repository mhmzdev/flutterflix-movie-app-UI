import 'package:flutterflix/configs/configs.dart';
import 'package:flutterflix/models/movie/movie.dart';
import 'package:flutterflix/static/movies.dart';
import 'package:flutterflix/ui/widgets/core/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterflix/ui/widgets/design/cards/movie_card.dart';
import 'package:flutterflix/ui/widgets/headless/scroll_column_expandable.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

part '_state.dart';

part 'widgets/_body.dart';
part 'widgets/_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}
