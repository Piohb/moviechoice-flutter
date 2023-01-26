import 'package:flutter/foundation.dart';

class Movie {
  final int id;
  final String title;
  final num notation;
  final String overview;
  final List<Category>? genres;

  Movie({
    required this.id, 
    required this.title, 
    required this.notation,
    required this.overview,
    this.genres = const []
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'], 
      title: json['title'], 
      notation: json['vote_average'], 
      overview: json['overview']
    );
  }
}