import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/components/level-selector/puzzle-selection-card.dart';
import 'package:four_pics_baybayin/data/LevelDefinitions.dart';
import 'package:four_pics_baybayin/helpers/audio-player.dart';
import 'package:four_pics_baybayin/state/ui-state.dart'; 

class PuzzleSelector extends StatefulWidget 
{
  const PuzzleSelector({ 
    super.key,
    required this.level, 
    required this.onSelect
  });

  final int level;
  final Function onSelect;

  final double width = 250;

  @override 
  State<PuzzleSelector> createState() => PuzzleSelectorState(); 
}

class PuzzleSelectorState extends State<PuzzleSelector> 
{
  double spacing = 10;

  late int puzzleA; 
  late int puzzleB; 
  late int puzzleC; 
  late int puzzleD; 

  late String puzzleAWord; 
  late String puzzleBWord; 
  late String puzzleCWord; 
  late String puzzleDWord;

  @override
  void initState() {
    super.initState();
    
    puzzleA = (widget.level - 1) * 4 + 1;
    puzzleB = (widget.level - 1) * 4 + 2;
    puzzleC = (widget.level - 1) * 4 + 3;
    puzzleD = (widget.level - 1) * 4 + 4;

    puzzleAWord = LevelDefinitions.levels[puzzleA - 1]["word"]!;
    puzzleBWord = LevelDefinitions.levels[puzzleB - 1]["word"]!;
    puzzleCWord = LevelDefinitions.levels[puzzleC - 1]["word"]!;
    puzzleDWord = LevelDefinitions.levels[puzzleD - 1]["word"]!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              createPuzzleSelectionCard(
                PuzzleSelectionCard(
                  image1: "assets/puzzles/$puzzleA.1-$puzzleAWord.jpeg",
                  image2: "assets/puzzles/$puzzleA.2-$puzzleAWord.jpeg",
                  image3: "assets/puzzles/$puzzleA.3-$puzzleAWord.jpeg",
                  image4: "assets/puzzles/$puzzleA.4-$puzzleAWord.jpeg",
                  puzzleNo: puzzleA, 
                  isSolved: false,
                  isSelectable: true,
                  correctWord: "SALITA",
                  onSelect: () {
                    playSound("click-1");
                  }
                )  
              ), 
              SizedBox(width: spacing),
              createPuzzleSelectionCard(
                PuzzleSelectionCard(
                  image1: "assets/puzzles/$puzzleB.1-$puzzleBWord.jpeg",
                  image2: "assets/puzzles/$puzzleB.2-$puzzleBWord.jpeg",
                  image3: "assets/puzzles/$puzzleB.3-$puzzleBWord.jpeg",
                  image4: "assets/puzzles/$puzzleB.4-$puzzleBWord.jpeg",
                  puzzleNo: puzzleB, 
                  isSolved: false,
                  isSelectable: true,
                  correctWord: "SALITA",
                  onSelect: () {
                    playSound("click-1");
                  }
                )  
              )
            ]
          ), 
          SizedBox(height: spacing), 
          Row(
            children: [
              createPuzzleSelectionCard(
                PuzzleSelectionCard(
                  image1: "assets/puzzles/$puzzleC.1-$puzzleCWord.jpeg",
                  image2: "assets/puzzles/$puzzleC.2-$puzzleCWord.jpeg",
                  image3: "assets/puzzles/$puzzleC.3-$puzzleCWord.jpeg",
                  image4: "assets/puzzles/$puzzleC.4-$puzzleCWord.jpeg",
                  puzzleNo: puzzleC, 
                  isSolved: false,
                  isSelectable: true,
                  correctWord: "SALITA",
                  onSelect: () {
                    playSound("click-1");
                  }
                )  
              ), 
              SizedBox(width: spacing),
              createPuzzleSelectionCard(
                PuzzleSelectionCard(
                  image1: "assets/puzzles/$puzzleD.1-$puzzleDWord.jpeg",
                  image2: "assets/puzzles/$puzzleD.2-$puzzleDWord.jpeg",
                  image3: "assets/puzzles/$puzzleD.3-$puzzleDWord.jpeg",
                  image4: "assets/puzzles/$puzzleD.4-$puzzleDWord.jpeg",
                  puzzleNo: puzzleD, 
                  isSolved: false,
                  isSelectable: true,
                  correctWord: "SALITA",
                  onSelect: () {
                    playSound("click-1");
                  }
                )  
              )
            ]
          ), 
        ]
      )
    );
  }

  Widget createPuzzleSelectionCard(PuzzleSelectionCard selector) {
    return Container(
      width: (widget.width - spacing) / 2, 
      child: FittedBox(
        child: selector
      )
    );
  }
}