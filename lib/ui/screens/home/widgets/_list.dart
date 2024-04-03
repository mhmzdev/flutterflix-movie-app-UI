part of '../home.dart';

class _List extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  const _List({
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    movies.shuffle();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: AppText.b1 + FontWeight.w700,
        ),
        Space.y.t05,
        SingleChildScrollView(
          padding: Space.a.t20,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: movies.map((movie) {
              return MovieCard(movie: movie);
            }).toList(),
          ),
        ),
      ],
    );
  }
}
