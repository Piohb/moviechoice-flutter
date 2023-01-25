import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_choice/constants.dart';
import 'package:movie_choice/fragments/swipeButton.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  List<Container> cards = [
    Container(
      alignment: Alignment.center,
      child: const Text('1'),
      color: CupertinoColors.activeBlue,
    ),
    Container(
      alignment: Alignment.center,
      child: const Text('2'),
      color: CupertinoColors.activeBlue,
    ),
    Container(
      alignment: Alignment.center,
      child: const Text('3'),
      color: CupertinoColors.activeBlue,
    )
  ];
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: bgColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: AppinioSwiper(
          cards: cards,
        ),
      ),

      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceAround,
        children: [
          SwipeButton(
            onPressed: (){},
            icon: const Icon(Icons.undo), 
            color: whiteColor
          ),
          SwipeButton(
            onPressed: (){},
            icon: const Icon(Icons.close), 
            color: redColor,
            isBig: true,
          ),
          SwipeButton(
            onPressed: (){}, 
            icon: const Icon(Icons.refresh), 
            color: yellowColor
          ),
          SwipeButton(
            onPressed: (){}, 
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