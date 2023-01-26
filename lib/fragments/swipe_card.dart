import 'package:flutter/cupertino.dart';
import 'package:movie_choice/constants.dart';
import 'package:movie_choice/model/movie.dart';

class SwipeCard extends StatelessWidget {

  const SwipeCard({
    super.key, 
    required this.movie
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ],
      ),
      alignment: Alignment.center,
      child: Column(

        children: [
          Flexible(
            flex: 5,
            child: Container(
              decoration: const BoxDecoration(
                color: yellowColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
          ),
          
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),

              child: Column(
                children: [
                  Text(
                    movie.title,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      color: bgColor,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    movie.overview,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: yellowColor,
                      fontSize: 12
                    )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}