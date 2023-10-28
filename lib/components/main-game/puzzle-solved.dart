import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/char-symbols/@base.dart';
import 'package:four_pics_baybayin/components/bottombar/bottom-back-bar.dart';
import 'package:four_pics_baybayin/components/bottombar/next-bar.dart';
import 'package:four_pics_baybayin/components/general/four-images.dart';
import 'package:four_pics_baybayin/components/main-game/input-word.dart';
import 'package:four_pics_baybayin/components/symbols/char-symbol.dart';
import 'package:four_pics_baybayin/data/CharacterDefinitions.dart';
import 'package:four_pics_baybayin/data/LevelDefinitions.dart';
import 'package:four_pics_baybayin/screens/level-selector.dart';
import 'package:four_pics_baybayin/state/game-state.dart';
import 'package:four_pics_baybayin/state/progress-state.dart';
import 'package:four_pics_baybayin/state/ui-state.dart'; 

class PuzzleSolved extends StatefulWidget 
{
  const PuzzleSolved({ 
    super.key,
    required this.onNext
  });

  final Function onNext;

  @override 
  State<PuzzleSolved> createState() => PuzzleSolvedState(); 
}

class PuzzleSolvedState extends State<PuzzleSolved> 
{
  @override
  Widget build(BuildContext context) {
    
    int puzzleNo = 
      gameState.getCurrentPuzzleNo();
    
    String currentWord = 
      gameState.getCurrentWord();

    String syllablesString = 
      LevelDefinitions.levels[gameState.getCurrentPuzzleNo() - 1]["syllables"]!;

    List<String> correctSyllables = syllablesString.split("-");
    List<String> currentPuzzleInput = gameState.getCurrentPuzzleInput(); 
    List<String> currentSymbols = gameState.getCurrentPuzzleSymbols();

    GlobalKey<InputWordState> inputWord = GlobalKey<InputWordState>();
    
    final locations = gameState.getCurrentPuzzleState().locations;

    List<Widget> wordSymbols = []; 

    CharSymbolBase tileFont = 
      uiState.tilesets[uiState.tileFont][0];

    for(int i = 0; i < gameState.getCurrentSyllables().length; i++) {
      Widget symbol = 
        CharacterDefinitions(tileFont).createCharacter(
          gameState.getCurrentSyllables()[i], 
          50, 
          50
        );

      wordSymbols.add(symbol);
      wordSymbols.add(const SizedBox(width: 5));

    }

    final int attempts = progressState.forCurrentPuzzle().attempts;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.9)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "PUZZLE SOLVED", 
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )
                  ), 
                  const SizedBox(height: 20),
                  FourImages(
                    image1: "assets/puzzles/$puzzleNo.1-$currentWord.jpeg", 
                    image2: "assets/puzzles/$puzzleNo.2-$currentWord.jpeg", 
                    image3: "assets/puzzles/$puzzleNo.3-$currentWord.jpeg", 
                    image4: "assets/puzzles/$puzzleNo.4-$currentWord.jpeg", 
                    width: 280, 
                    selectable: true,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: wordSymbols
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      gameState.getCurrentWord().toUpperCase(),
                      style: const TextStyle(
                        fontSize: 30, 
                        color: Colors.white, 
                        fontWeight: FontWeight.bold
                      )
                    )
                  ), 
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      Container(
                        width: 280, 
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15), 
                            topRight: Radius.circular(15)
                          )
                        ),
                        child: const Center(
                          child: Text(
                            "MINIMAL ATTEMPTS BONUS",
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            )
                          )
                        )
                      ),
                      Container(
                        width: 280, 
                        padding: const EdgeInsets.symmetric(vertical: 15), 
                        decoration: const BoxDecoration(
                          color: Colors.black
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "+${gameState.computeCurrentPuzzleReward()}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold, 
                                  color: Colors.white,
                                  fontSize: 30
                                )
                              ), 
                              const SizedBox(width: 5), 
                              Image.asset(
                                "assets/icons/icon-coin.png", 
                                width: 30
                              )
                            ]
                          )
                        )
                      ),
                      Container(
                        width: 280, 
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15), 
                            bottomRight: Radius.circular(15)
                          )
                        ),
                        child:  Center(
                          child: Text(
                            "$attempts ATTEMPTS",
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            )
                          )
                        )
                      )
                    ]
                  )
                ]
              )
            )
          ),

          // BOTTOMBAR SECTION
          NextBar(
            title: "PICK NEXT PUZZLE",
            onNext: () {
              widget.onNext();
            } 
          ), 
        ]
      )
    );
  }
}