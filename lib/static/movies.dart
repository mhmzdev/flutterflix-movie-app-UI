import 'package:faker_dart/faker_dart.dart';
import 'package:flutterflix/models/movie/movie.dart';

final faker = Faker.instance;

Movie generateMovie(int index) {
  final mov = Movie(
    title: faker.lorem.word(),
    image: 'assets/movies/${index + 1}.jpeg',
    comments: [],
  );

  return mov;
}

final movies = List.generate(8, generateMovie);
