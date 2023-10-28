import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/char-symbols/@base.dart';
import 'package:four_pics_baybayin/char-symbols/deko.dart';
import 'package:four_pics_baybayin/char-symbols/robotika.dart';
import 'package:four_pics_baybayin/char-symbols/sarimanok.dart';
import 'package:four_pics_baybayin/char-symbols/sejong.dart';
import 'package:four_pics_baybayin/char-symbols/sisil.dart';
import 'package:four_pics_baybayin/components/bottombar/bottom-back-bar.dart';
import 'package:four_pics_baybayin/components/general/field-value.dart';
import 'package:four_pics_baybayin/components/general/four-images.dart';
import 'package:four_pics_baybayin/components/level-selector/puzzle-selection-card.dart';
import 'package:four_pics_baybayin/components/level-selector/puzzle-selector.dart';
import 'package:four_pics_baybayin/components/topbar/back-bar.dart';
import 'package:four_pics_baybayin/components/general/box-select.dart';
import 'package:four_pics_baybayin/components/general/custom-switch.dart';
import 'package:four_pics_baybayin/components/backdrop/modal-container.dart';
import 'package:four_pics_baybayin/components/backdrop/modal-dialog.dart';
import 'package:four_pics_baybayin/data/CharacterDefinitions.dart';
import 'package:four_pics_baybayin/data/LevelDefinitions.dart';
import 'package:four_pics_baybayin/helpers/audio-player.dart';
import 'package:four_pics_baybayin/components/backdrop/bgi-box.dart';
import 'package:four_pics_baybayin/components/topbar/game-bar.dart';
import 'package:four_pics_baybayin/helpers/goto.dart';
import 'package:four_pics_baybayin/screens/main-game.dart';
import 'package:four_pics_baybayin/screens/main-menu.dart';
import 'package:four_pics_baybayin/screens/progress.dart';
import 'package:four_pics_baybayin/screens/splash.dart';
import 'package:four_pics_baybayin/state/game-state.dart';
import 'package:four_pics_baybayin/state/progress-state.dart';
import 'package:four_pics_baybayin/state/ui-state.dart';
import 'package:provider/provider.dart'; 

class SolveInfo extends StatefulWidget 
{
  const SolveInfo({
    super.key, 
    required this.level,
    required this.puzzle
  });

  final int level;
  final int puzzle;

  @override 
  State<SolveInfo> createState() => SolveInfoState();
}

class SolveInfoState extends State<SolveInfo>
{
  @override
  bool get wantKeepAlive => true; 

  late Image logoImage; 

  int viewLevel = gameState.currentLevel;
  int maxLevel = (LevelDefinitions.levels.length ~/ 4).toInt();
  
  int value = 0;

  bool isLeftTapped = false; 
  bool isRightTapped = false;
  

  @override 
  void initState() {
    super.initState(); 
  }

  @override
  Widget build(BuildContext context) {
    int puzzleNo = (widget.level - 1) * 4 + widget.puzzle + 1;
    String word = LevelDefinitions.levels[puzzleNo - 1]["word"]!;
    double topOffset = MediaQuery.of(context).viewPadding.top;
    List<String> syllables = gameState.getSyllables(puzzleNo); 
    CharSymbolBase tileFont = uiState.tilesets[uiState.tileFont][0];
    int attempts = progressState.forPuzzle(puzzleNo).attempts;
    String solvedOn = progressState.forPuzzle(puzzleNo).solvedOn;

    List<Widget> wordSymbols = [];

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

    return Scaffold(
      body: Consumer<UIState>(
        builder: (context, uiState, child) {
          return BGIBox(
            child: Column(
              children: [
                SizedBox(height: topOffset + 30),
                Expanded(
                  child: Column(
                    children: [
                      Container( 
                        width: double.maxFinite, 
                        child: Center(
                          child: Text(
                            "PUZZLE $puzzleNo", 
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            )
                          )
                        )
                      ),

                      const SizedBox(height: 10),

                      Container( 
                        width: double.maxFinite, 
                        decoration: const BoxDecoration(
                          color: Colors.white
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text(
                            word.toUpperCase(), 
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            )
                          )
                        ), 
                      ),

                      const SizedBox(height: 30), 
                      
                      Center(
                        child: Stack(
                          children: [
                            FourImages(
                              image1: "assets/puzzles/$puzzleNo.1-$word.jpeg",
                              image2: "assets/puzzles/$puzzleNo.2-$word.jpeg",
                              image3: "assets/puzzles/$puzzleNo.3-$word.jpeg",
                              image4: "assets/puzzles/$puzzleNo.4-$word.jpeg", 
                              width: 280 
                            ),
                            Positioned(
                              top: (280 * 1.5 / 2) - (230 / 2),
                              left: (280 / 2) - (230 / 2),
                              child: Transform.rotate(
                                angle: -0.2, 
                                child: Container(
                                  width: 230, 
                                  padding: const EdgeInsets.symmetric(vertical: 20), 
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(209, 231, 219, 219), 
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 3,
                                        offset: Offset(0, 3), // changes position of shadow
                                      )
                                    ]
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/icons/icon-check.png", 
                                        width: 30
                                      ), 
                                      const SizedBox(width: 10), 
                                      const Text(
                                        "SOLVED",
                                        style: TextStyle(
                                          fontSize: 30, 
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                        )
                                      )
                                    ],
                                  )
                                )
                              )
                            )
                          ]
                        )
                      ), 

                      const SizedBox(height: 15), 

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...wordSymbols
                        ]
                      ),

                      const SizedBox(height: 30), 

                      FieldValue(
                        width: 280, 
                        labelProp: 0.7, 
                        label: "LEVEL", 
                        value: widget.level.toString()
                      ),

                      const SizedBox(height: 5),

                      FieldValue(
                        width: 280, 
                        labelProp: 0.7, 
                        label: "ATTEMPTS", 
                        value: attempts.toString()
                      ),

                      const SizedBox(height: 5),

                      FieldValue(
                        width: 280, 
                        labelProp: 0.5, 
                        label: "SOLVED ON", 
                        value: solvedOn
                      )
                    ]
                  )
                ), 

                BottomBackBar(
                  title: "BACK TO LEVEL PROGRESS",
                  target:  ProgressScreen(viewLevel: widget.level)
                )

              ]
            )
          );
        }
      )
    );
  } 


  
}
