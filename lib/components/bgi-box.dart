import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/state/ui-state.dart'; 

class BGIBox extends StatefulWidget 
{
  const BGIBox({ 
    super.key,
    required this.child
  });

  final Widget child;

  @override 
  State<BGIBox> createState() => BGIBoxState(); 
}

class BGIBoxState extends State<BGIBox> 
{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, 
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background-patterns/denim.webp"),
                repeat: ImageRepeat.repeat
              )
            )
          ),
          widget.child
        ]
      )
    );
  }
}