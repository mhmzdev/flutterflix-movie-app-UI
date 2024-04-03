import 'package:flutter/material.dart';
import 'package:flutterflix/configs/configs.dart';
import 'package:flutterflix/models/movie/movie.dart';
import 'package:flutterflix/router/routes.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return TouchableOpacity(
      onTap: () => AppRoutes.movieDetails.push(
        context,
        arguments: {'movie': movie},
      ),
      child: Container(
        margin: Space.r.t20,
        decoration: AppProps.card.copyWith(
          image: DecorationImage(
            image: AssetImage(
              movie.image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        height: 65.un(),
        width: 50.un(),
      ),
    );
  }
}
