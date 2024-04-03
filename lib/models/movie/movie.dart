import 'package:flutterflix/models/movie/comment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Movie with _$Movie {
  const factory Movie({
    required String title,
    required String image,
    required List<Comment> comments,
  }) = _Movie;

  factory Movie.fromJson(Map<String, Object?> json) => _$MovieFromJson(json);
}
