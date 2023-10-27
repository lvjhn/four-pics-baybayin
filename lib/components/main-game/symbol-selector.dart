import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/char-symbols/@base.dart';
import 'package:four_pics_baybayin/components/general/shake-widget.dart';
import 'package:four_pics_baybayin/data/CharacterDefinitions.dart';
import 'package:four_pics_baybayin/helpers/audio-player.dart';
import 'package:four_pics_baybayin/state/game-state.dart';
import 'package:four_pics_baybayin/state/ui-state.dart';
import 'package:provider/provider.dart'; 

class SymbolSelector extends StatefulWidget 
{
  const SymbolSelector({ 
    super.key,
    required this.characters,
    required this.onSelect, 
    required this.tileFont
  });

  final List<String> characters;
  final Function onSelect;
  final CharSymbolBase tileFont;

  @override 
  State<SymbolSelector> createState() => SymbolSelectorState(); 
}

class SymbolSelectorState extends State<SymbolSelector> 
{
  bool foo = false;

  @override 
  void initState() {
    super.initState(); 
  }

  @override
  Widget build(BuildContext context) {
    double spacing = 5;


    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              createSymbol(context, 0, gameState.getCurrentPuzzleSymbols()[0]),
              SizedBox(width: spacing),
              createSymbol(context, 1, gameState.getCurrentPuzzleSymbols()[1]),
              SizedBox(width: spacing),
              createSymbol(context, 2, gameState.getCurrentPuzzleSymbols()[2]),
              SizedBox(width: spacing),
              createSymbol(context, 3, gameState.getCurrentPuzzleSymbols()[3]),
              SizedBox(width: spacing),
              createSymbol(context, 4, gameState.getCurrentPuzzleSymbols()[4]),
            ]
          ),
          SizedBox(height: spacing), 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,  
            children: [
              createSymbol(context, 5, gameState.getCurrentPuzzleSymbols()[5]),
              SizedBox(width: spacing),
              createSymbol(context, 6, gameState.getCurrentPuzzleSymbols()[6]),
              SizedBox(width: spacing),
              createSymbol(context, 7, gameState.getCurrentPuzzleSymbols()[7]),
              SizedBox(width: spacing),
              createSymbol(context, 8, gameState.getCurrentPuzzleSymbols()[8]),
              SizedBox(width: spacing),
              createSymbol(context, 9, gameState.getCurrentPuzzleSymbols()[9]),
            ]
          )
        ]
      )
    );
  }

  Widget createSymbol(BuildContext context, int index, String character) {
    return GestureDetector(
      onTap: () {
        if(character != "-") {
          playSound("click-1");
          
          if(gameState.isInputFilled()) {
            return;
          }

          widget.onSelect(index, character);
        }
      },
      child: Container(
        width: 50,
        height: 50, 
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 19, 18, 18),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: character == "-" ? Colors.white : Colors.transparent,
            width: character == "-" ? 0.5 : 0
          )
        ),
        child: character == "-" || character == Null ? 
          const Text("") : 
          CharacterDefinitions(widget.tileFont)
            .createCharacter(character, 50, 50)
      )
    );
  }
}