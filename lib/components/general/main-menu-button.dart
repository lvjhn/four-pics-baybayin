import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/helpers/audio-player.dart';

class MainMenuButton extends StatefulWidget 
{
  const MainMenuButton({ 
    super.key, 
    required this.child, 
    required this.onPressed
  });

  final Widget child;
  final Function onPressed;

  @override 
  State<MainMenuButton> createState() => MainMenuButtonState();
}

class MainMenuButtonState extends State<MainMenuButton>   
  with TickerProviderStateMixin
{
  bool isHovered = false; 

  @override 
  void initState() {
    super.initState(); 
  }

  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (TapUpDetails details) {
        playSound("click-1");
        widget.onPressed();
        setState(() {
          isHovered = false;
        });
      },
      onTapDown: (TapDownDetails details) {
        setState(() { 
          isHovered = true;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: isHovered ? const Color.fromARGB(255, 194, 194, 28) : Colors.yellowAccent,
          border: Border.all(color: Colors.white, width: 3)
        ),
        child: widget.child,
      )
    );
  }
}