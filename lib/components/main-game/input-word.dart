import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/char-symbols/@base.dart';
import 'package:four_pics_baybayin/char-symbols/sisil.dart';
import 'package:four_pics_baybayin/components/general/shake-widget.dart';
import 'package:four_pics_baybayin/data/CharacterDefinitions.dart';
import 'package:four_pics_baybayin/helpers/audio-player.dart';
import 'package:four_pics_baybayin/state/game-state.dart';
import 'package:four_pics_baybayin/state/progress-state.dart';
import 'package:four_pics_baybayin/state/ui-state.dart'; 

class InputWord extends StatefulWidget 
{
  const InputWord({ 
    super.key,
    required this.locations, 
    required this.onRemove,
    required this.tileFont
  });


  final List<int> locations;
  final CharSymbolBase tileFont;

  final Function onRemove;

  @override 
  State<InputWord> createState() => InputWordState(); 
}

class InputWordState extends State<InputWord> 
{
  final shakeKey = GlobalKey<ShakeWidgetState>();
  

  @override 
  void initState() {
    super.initState(); 
  }
 

  bool isCorrect() {
    List<String> correct = gameState.getCurrentSyllables(); 
    List<String> current = gameState.getCurrentPuzzleInput();

    for(int i = 0; i < current.length; i++) {
      if(current[i] != correct[i]) {
        return false;
      }
    }
    return true;
  }

  void shake() {
    shakeKey.currentState?.shake();
  }

  @override
  Widget build(BuildContext context) {
    double spacing = 5; 

    List<Widget> input = []; 

    List<String> correct = gameState.getCurrentSyllables(); 
    List<String> current = gameState.getCurrentPuzzleInput();

    
    for(int i = 0; i < correct.length; i++) {
      input.add(createSlot(context, i, current[i])); 
      if(i != current.length - 1) {
        input.add(SizedBox(width: spacing));
      }
    } 


    return ShakeWidget(
      key: shakeKey,
      shakeOffset: 10,
      shakeCount: 5,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...input
          ]
        )
      )
    );
  }

  Widget createSlot(BuildContext context, int index, String character) {

    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        if(gameState.getCurrentPuzzleState().fixed[index] == false) {
          if(character != "-") {
            playSound("click-1");
            widget.onRemove(index, character, widget.locations[index]);
          }
        }
      },
      child: Container(
        width: 50,
        height: 50, 
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 22, 22, 22),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: gameState.getCurrentPuzzleState().fixed[index] ? 
                Colors.green :
                Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 3)
            )
          ],
          border: Border.all(
            color: character == "-" ? Colors.white : Colors.transparent,
            width: character == "-" ? 2 : 0
          )
        ), 
        child: character == "-" ? 
          const Text("") : 
          CharacterDefinitions(widget.tileFont).createCharacter(character, 50, 50)
      )
    );
  }
}