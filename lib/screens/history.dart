import 'package:flutter/material.dart';
import 'package:movie_choice/constants.dart';
import 'package:movie_choice/model/movie.dart';
import 'package:movie_choice/model/category.dart';
import 'package:movie_choice/screens/movie_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _History();
}

class _History extends State<History> {
  List<Movie>? movies = [
    Movie(id: 1, title: "Star Wars II", notation: 3.2, overview: 'description', genres: [
      const Category(name: 'Action', id: 28)
    ]),
    Movie(id: 2, title: "Ready Playe One", notation: 4.5,  overview: 'description', genres: [
      const Category(id: 3, name: "Futuriste"),
      const Category(id: 7, name: "VR")
    ])
  ];
  SharedPreferences? prefs;

  void setMovie(Movie movie) {
    prefs?.setString('movie', movie.id.toString());
  }

  Future<void> openMovie(Movie movie) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return MovieDetailsWidget(movie: movie);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final moviesList = (movies ?? [])
        .map((movie) => ListTile(
            title: Text(
              movie.title,
              style: const TextStyle(fontWeight: FontWeight.bold)
            ),
        
            trailing: Text(movie.notation.toString())
          )
        ).toList();

    return Scaffold(
        backgroundColor: bgColor,

        body: ListView(children: moviesList));
  }
}