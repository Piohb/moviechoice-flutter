import 'package:flutter/material.dart';
import 'package:movie_choice/constants.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Menu extends StatefulWidget {
  const Menu({super.key, required this.title});
  final String title;

  @override
  State<Menu> createState() => _Menu();
}

class _Menu extends State<Menu> {
  var _currentIndex = 1;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: bgColor,
        centerTitle: true,
        elevation: 0,
        title: Text(widget.title)
      ),

      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState( () => _currentIndex = i),
        items: [
          /// SETTINGS
          SalomonBottomBarItem(
            icon: const Icon(Icons.settings),
            title: const Text('Préférences'),
            selectedColor: whiteColor
          ),

          /// MOVIES
          SalomonBottomBarItem(
            icon: const Icon(Icons.movie), 
            title: const Text('Films'),
            selectedColor: whiteColor
          ),

          /// HISTORY
          SalomonBottomBarItem(
            icon: const Icon(Icons.history), 
            title: const Text('Historique'),
            selectedColor: whiteColor
          )
        ],
      ),

    );
  }
}