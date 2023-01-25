import 'package:flutter/material.dart';

class SwipeButton extends StatelessWidget {

  final Function onPressed;
  final Widget icon;
  final Color color;
  final bool isBig;

  const SwipeButton({
    super.key, 
    required this.onPressed,
    required this.icon, 
    required this.color, 
    this.isBig = false 
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          width: isBig ? 2 : 1,
          color: color
        ),
      ),

      child: IconButton(
        onPressed: (() => onPressed),
        icon: icon,
        color: color,
        iconSize: isBig ? 30 : 15,
        splashRadius: isBig ? 30 : 25,
      ),
    );

  }
}