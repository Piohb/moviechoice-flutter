import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:movie_choice/constants.dart';
import 'package:movie_choice/fragments/swipe_button.dart';
import 'package:movie_choice/fragments/swipe_card.dart';
import 'package:http/http.dart' as http;
import 'package:movie_choice/model/movie.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {

  List<Movie>movies = [];

  Future<void> loadMovies() async {
    final response = await http.get(
      Uri.parse('$apiUrl/discover/movie?api_key=$apiKey&language=fr-FR')
    );
    final json = jsonDecode(response.body);
    var parsed = json['results'] as List;
    
    setState(() {
      movies = parsed.map<Movie>((item) => Movie.fromJson(item)).toList();
    });
  }

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  final AppinioSwiperController controller = AppinioSwiperController();
  
  @override
  Widget build(BuildContext context){

    final List<SwipeCard> cards = movies
      .map((movie) => 
        SwipeCard(movie: movie)
      ).toList();

    return Scaffold(
      backgroundColor: bgColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: AppinioSwiper(
          cards: cards,
          controller: controller,
        ),
      ),

      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceAround,
        children: [
          SwipeButton(
            onPressed: (){
              controller.unswipe();
            },
            icon: const Icon(Icons.undo), 
            color: whiteColor
          ),
          SwipeButton(
            onPressed: (){
              controller.swipeLeft();
            },
            icon: const Icon(Icons.close), 
            color: redColor,
            isBig: true,
          ),
          SwipeButton(
            onPressed: (){

            }, 
            icon: const Icon(Icons.refresh), 
            color: yellowColor
          ),
          SwipeButton(
            onPressed: (){
              controller.swipeRight();
            }, 
            icon: const Icon(Icons.done), 
            color: greenColor,
            isBig: true,
          ),
          SwipeButton(
            onPressed: (){}, 
            icon: const Icon(Icons.visibility), 
            color: whiteColor
          ),
        ]
      ),
    );
  }
}