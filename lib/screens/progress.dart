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
import 'package:four_pics_baybayin/components/general/four-images.dart';
import 'package:four_pics_baybayin/components/level-selector/puzzle-selection-card.dart';
import 'package:four_pics_baybayin/components/level-selector/puzzle-selector.dart';
import 'package:four_pics_baybayin/components/topbar/back-bar.dart';
import 'package:four_pics_baybayin/components/general/box-select.dart';
import 'package:four_pics_baybayin/components/general/custom-switch.dart';
import 'package:four_pics_baybayin/components/backdrop/modal-container.dart';
import 'package:four_pics_baybayin/components/backdrop/modal-dialog.dart';
import 'package:four_pics_baybayin/data/LevelDefinitions.dart';
import 'package:four_pics_baybayin/helpers/audio-player.dart';
import 'package:four_pics_baybayin/components/backdrop/bgi-box.dart';
import 'package:four_pics_baybayin/components/topbar/game-bar.dart';
import 'package:four_pics_baybayin/helpers/goto.dart';
import 'package:four_pics_baybayin/screens/main-game.dart';
import 'package:four_pics_baybayin/screens/main-menu.dart';
import 'package:four_pics_baybayin/screens/solve-info.dart';
import 'package:four_pics_baybayin/screens/splash.dart';
import 'package:four_pics_baybayin/state/game-state.dart';
import 'package:four_pics_baybayin/state/progress-state.dart';
import 'package:four_pics_baybayin/state/ui-state.dart';
import 'package:provider/provider.dart'; 

class ProgressScreen extends StatefulWidget 
{
  const ProgressScreen({
    super.key, 
    this.viewLevel = -1
  });

  final int viewLevel;

  @override 
  State<ProgressScreen> createState() => ProgressScreenState();
}

class ProgressScreenState extends State<ProgressScreen>
{
  @override
  bool get wantKeepAlive => true; 

  late Image logoImage; 

  late int viewLevel;
  int maxLevel = (LevelDefinitions.levels.length ~/ 4).toInt();
  
  int value = 0;

  bool isLeftTapped = false; 
  bool isRightTapped = false;

  @override 
  void initState() {
    super.initState(); 

    if(widget.viewLevel == -1) {
      viewLevel = gameState.currentLevel;
    } else {
      viewLevel = widget.viewLevel;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Consumer<UIState>(
        builder: (context, uiState, child) {
          return BGIBox( 
            child: Stack(
              children: [
                Column(
                  children: [
                    // GAMEBAR SECTION
                    const GameBar(isHomeIconVisible: true),
                  
                    // HEADER SECTION 
                    createHeaderSection(context), 
                    
                    Expanded( 
                      child: Stack(
                        children: [ 
                          Center(
                            child: PuzzleSelector(
                              level: viewLevel, 
                              enableSelectUnlocked: true,
                              onSelect: (int i) {
                                debugPrint("Selecting $i");
                                
                                goto(context, SolveInfo(
                                  level: viewLevel, 
                                  puzzle: i 
                                ));
                              }
                            )
                          ), 
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 15),
                                    Visibility(
                                      visible: viewLevel > 1,  
                                      child: InkWell(
                                        onTapDown: (TapDownDetails details) {
                                          if(viewLevel == 1) {
                                            return; 
                                          }
                                          playSound("click-1");

                                          setState(() {
                                            viewLevel -= 1;
                                            isLeftTapped = true;
                                          });
                                        },
                                        onTapUp: (TapUpDetails details) {
                                          setState(() {
                                            isLeftTapped = false;
                                          });
                                        },
                                        child:  Icon(
                                          Icons.chevron_left, 
                                          size: 50,
                                          color: isLeftTapped ?
                                            Colors.white :
                                            Colors.yellow
                                        )
                                      )
                                    ),
                                    const Expanded(
                                      child: Text("")
                                    ),
                                    Visibility(
                                      visible: 
                                        !(viewLevel == maxLevel || 
                                          viewLevel == gameState.currentLevel),
                                      child: InkWell(
                                        onTapDown: (TapDownDetails details) {
                                          playSound("click-1");
                                          setState(() {
                                            viewLevel += 1;
                                            isRightTapped = true;
                                          });
                                        },
                                        onTapUp: (TapUpDetails details) {
                                          setState(() {
                                            isRightTapped = false;
                                          });
                                        },
                                        child:  Icon(
                                          Icons.chevron_right, 
                                          size: 50,
                                          color: isRightTapped ?
                                            Colors.white :
                                            Colors.yellow
                                        )
                                      )
                                    ),
                                    SizedBox(width: 15),
                                  ]
                                )
                              ],
                            )
                          )
                        ]
                      )
                    ),


                   
                    
                  ]
                ),
               
                
              ]
            )
          );
        }
      )
    );
  } 

  Widget createHeaderSection(BuildContext context) {
    int currentLevel = gameState.currentLevel;
    int levelStart = (currentLevel - 1) * 4 + 1;
    int levelEnd = (currentLevel - 1) * 4 + 4;

    return Container(
      width: double.infinity, 
      height: 150, 
      decoration:  BoxDecoration(
        color: const Color.fromRGBO(234, 234, 234, 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
       
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]
      ),
      child: Column(
        children: [ 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                height: 150,
                child: Stack(
                  children: [
                    Positioned(
                      top: 40, 
                      left: 60,
                      child: Column(
                        children: [
                          Container(
                            height: 50, 
                            width: 270,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                              )
                            ),
                            child:  Center(
                              child: Text(
                                "Level $viewLevel of $maxLevel" ,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                )
                              )
                            )
                          ),
                          Container(
                            width: 270,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5),
                              )
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 220, 
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(50, 50, 50, 1.0)
                                    ),
                                    padding: const EdgeInsets.all(2.5),
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 36),
                                      child: const Text(
                                        "AVG. ATTEMPTS / PUZZLE",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold
                                        )
                                      )
                                    )
                                  )
                                ),
                                SizedBox(
                                  width: 50, 
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(150, 150, 150, 1.0),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(5),
                                      )
                                    ),
                                    padding: const EdgeInsets.all(2.5),
                                    child: Center(
                                      child: Text(
                                        progressState.computeLevelAverageAttempts(viewLevel).toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold
                                        )
                                      )
                                    )
                                  )
                                )
                              ],
                            )
                          ),
                          
                          
                        ],
                      )
                    ),
                    Positioned(
                      top: 25, 
                      left: 0,
                      child: Image.asset(
                        "assets/icons/icon-medal.png", 
                        width: 100
                      )
                    )
                  ],
                )
              )
              
            ]
          )
        ]
      )
    );
  }
  
}
