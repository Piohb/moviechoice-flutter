import 'package:movie_choice/models/categories.dart';

class Movie {
  final int id;
  final String name;
  final double rate;
  final List<Category> categories;

  Movie(
      {required this.id,
      required this.name,
      required this.rate,
      required this.categories});
}
