part of 'movie_details.dart';

class _ScreenState extends ChangeNotifier {
  _ScreenState({required Map<String, dynamic> args}) {
    movie = args['movie'] as Movie;
  }

  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  late Movie movie;
}
