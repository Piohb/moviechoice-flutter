import 'package:flutter/material.dart';
import 'package:movie_choice/constants.dart';
import 'package:movie_choice/screens/history.dart';
import 'package:movie_choice/screens/home.dart';
import 'package:movie_choice/screens/settings.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Menu extends StatefulWidget {
  const Menu({super.key, required this.title});
  final String title;

  @override
  State<Menu> createState() => _Menu();
}

class _Menu extends State<Menu> {
  var _currentIndex = 1;

  static const List<Widget> _pages = <Widget>[Settings(), Home(), History()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: bgColor,
          centerTitle: true,
          elevation: 0,
          title: Text(widget.title)),
      body: Center(child: _pages.elementAt(_currentIndex)),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// SETTINGS
          SalomonBottomBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('Préférences'),
              selectedColor: bgColor,
              unselectedColor: bgColor),

          /// MOVIES
          SalomonBottomBarItem(
              icon: const Icon(Icons.movie),
              title: const Text('Films'),
              selectedColor: bgColor,
              unselectedColor: bgColor),

          /// HISTORY
          SalomonBottomBarItem(
              icon: const Icon(Icons.history),
              title: const Text('Historique'),
              selectedColor: bgColor,
              unselectedColor: bgColor)
        ],
      ),
    );
  }
}
