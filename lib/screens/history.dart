import 'package:flutter/material.dart';
import 'package:movie_choice/constants.dart';
import 'package:movie_choice/models/categories.dart';
import 'package:movie_choice/models/movies.dart';
import 'package:movie_choice/screens/movie_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _History();
}

class _History extends State<History> {
  List<Movie>? movies = [
    Movie(id: 1, name: "Star Wars II", rate: 3.2, categories: [
      Category(id: 3, name: "Futuriste"),
      Category(id: 7, name: "Guerre")
    ]),
    Movie(id: 2, name: "Ready Playe One", rate: 4.5, categories: [
      Category(id: 3, name: "Futuriste"),
      Category(id: 7, name: "VR")
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
            // onTap: () {
            //   setMovie(movie);
            //   openMovie(movie);
            // },
            title: Text(movie.name,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            // leading:
            //     Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            //   movie.categories.map((category) => Text(category.name,
            //       style: const TextStyle(
            //           color: Color.fromRGBO(0, 188, 212, 1),
            //           fontWeight: FontWeight.bold))),
            // ]),
// movie.categories.map((category) => ListTile(
            trailing: Text(movie.rate.toString())))
        .toList();

    return Scaffold(
        backgroundColor: bgColor,
        // appBar: AppBar(title: Text('Historique de vos likes')),
        body: ListView(children: moviesList));
  }
}
