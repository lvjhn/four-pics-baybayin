import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/components/main-game/hint-button.dart';
import 'package:four_pics_baybayin/state/ui-state.dart'; 

class OtherControls extends StatefulWidget 
{
  const OtherControls({ 
    super.key
  });

  @override 
  State<OtherControls> createState() => OtherControlsState(); 
}

class OtherControlsState extends State<OtherControls> 
{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          createHintButton("A*", Colors.redAccent), 
          const SizedBox(width: 5),
          createHintButton("A-", Colors.blueAccent),
          const SizedBox(width: 5),
          createHintButton("A+", const Color.fromARGB(255, 2, 122, 64)),
          const SizedBox(width: 10),
          createAttemptsIndicator()
        ]
      )
    );
  }

  Widget createHintButton(String label, Color color) {
    return HintButton(
      label: label, 
      color: color
    );
  }

  Widget createAttemptsIndicator() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.white, width: 2)
      ), 
      child: Row(
        children: [
          Container(
            width: 45, 
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 7, 0, 0),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3), 
                bottomLeft: Radius.circular(3), 
              )
            ),
            child: const Center( 
              child: Text(
                "5",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white
                )
              )
            )
          ),
          Container(
            width: 75, 
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 248, 246, 246),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(3), 
                bottomRight: Radius.circular(3), 
              )
            ),
            child: const Center( 
              child: Text(
                "ATTEMPTS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11
                )
              )
            )
          )
        ]
      )
    );
  }
}