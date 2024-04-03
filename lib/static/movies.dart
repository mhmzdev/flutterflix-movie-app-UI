import 'package:faker_dart/faker_dart.dart';
import 'package:flutterflix/models/movie/comment.dart';
import 'package:flutterflix/models/movie/movie.dart';

final faker = Faker.instance;

Comment generateComment(int index) {
  final comment = Comment(
    uid: '',
    comment: faker.lorem.sentence(),
  );
  return comment;
}

Movie generateMovie(int index) {
  final mov = Movie(
    title: faker.lorem.word(),
    image: 'assets/movies/${index + 1}.jpeg',
    comments: List.generate(4, generateComment),
  );

  return mov;
}

final movies = List.generate(8, generateMovie);
