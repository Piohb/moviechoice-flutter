import 'package:flutter/material.dart';
import 'package:movie_choice/models/movies.dart';

class MovieDetailsWidget extends StatefulWidget {
  final Movie movie;

  const MovieDetailsWidget({super.key, required this.movie});

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidget();
}

class _MovieDetailsWidget extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return const Text("Détail film");
  }
}
