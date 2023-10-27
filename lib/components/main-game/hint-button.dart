

import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/state/ui-state.dart'; 

class HintButton extends StatefulWidget 
{
  const HintButton({ 
    super.key,
    required this.color,
    required this.label,
    required this.action, 
    required this.enabled
  });

  final Color color; 
  final String label;
  final Function action;
  final bool enabled;

  @override 
  State<HintButton> createState() => HintButtonState(); 
}

class HintButtonState extends State<HintButton> 
{
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
      onTapDown: (TapDownDetails tapDownDetails) {
        setState(() { isTapped = true; });
      }, 
      onTapUp: (TapUpDetails tapUpDetails) {
        if(widget.enabled) {
          setState(() { isTapped = false; });
          widget.action();
        }
      },
      child: Container(
        width: 40, 
        height: 40,
        decoration: BoxDecoration(
          color: widget.enabled ? widget.color : Colors.grey,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: isTapped ? 2 : 1,
              blurRadius: isTapped ? 2 : 1,
              offset: const Offset(0, 3)
            )
          ]
        ),
        child: Center( 
          child: Text(
            widget.label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            )
          )
        )
      )
    );
  }
}