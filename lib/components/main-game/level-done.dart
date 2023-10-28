import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/char-symbols/@base.dart';
import 'package:four_pics_baybayin/components/bottombar/bottom-back-bar.dart';
import 'package:four_pics_baybayin/components/bottombar/next-bar.dart';
import 'package:four_pics_baybayin/components/general/four-images.dart';
import 'package:four_pics_baybayin/components/main-game/input-word.dart';
import 'package:four_pics_baybayin/components/symbols/char-symbol.dart';
import 'package:four_pics_baybayin/data/CharacterDefinitions.dart';
import 'package:four_pics_baybayin/data/LevelDefinitions.dart';
import 'package:four_pics_baybayin/helpers/audio-player.dart';
import 'package:four_pics_baybayin/helpers/goto.dart';
import 'package:four_pics_baybayin/screens/level-selector.dart';
import 'package:four_pics_baybayin/screens/main-menu.dart';
import 'package:four_pics_baybayin/state/game-state.dart';
import 'package:four_pics_baybayin/state/progress-state.dart';
import 'package:four_pics_baybayin/state/ui-state.dart'; 

class LevelDone extends StatefulWidget 
{
  const LevelDone({ 
    super.key,
    required this.onNext
  });

  final Function onNext;

  @override 
  State<LevelDone> createState() => LevelDoneState(); 
}

class LevelDoneState extends State<LevelDone> 
{
  @override 
  void initState() {
    super.initState(); 
    if(mounted) {
      playSound("next-level");
    }
  }

  @override
  Widget build(BuildContext context) {
    
    int level = gameState.currentLevel;
    int aveAttempts = progressState.computeLevelAverageAttempts(level);

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

                  Center(
                    child: Image.asset(
                      "assets/icons/icon-medal.png", 
                      width: 200
                    ),
                  ),
                  
                  const SizedBox(height: 20),

                  const Text(
                    "LEVEL DONE", 
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )
                  ), 

                  const SizedBox(height: 20),

                  Container(
                    width: double.maxFinite, 
                    decoration: const BoxDecoration(
                      color: Colors.white
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: const Center(
                      child: Text(
                        "MINIMAL ATTEMPTS BONUS", 
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16, 
                          fontWeight: FontWeight.bold
                        )
                      )
                    )
                  ), 
                  
                  Container(
                    width: double.maxFinite, 
                    decoration: const BoxDecoration(
                      color: Colors.black
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "+${gameState.computeRewardForLevelAttempt(aveAttempts)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold, 
                            color: Colors.white,
                            fontSize: 40
                          )
                        ), 
                        const SizedBox(width: 5), 
                        Image.asset(
                          "assets/icons/icon-coin.png", 
                          width: 40
                        )
                      ]
                    )
                  ), 

                  Container(
                    width: double.maxFinite, 
                    decoration: const BoxDecoration(
                      color: Colors.white
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        "AVERAGE ATTEMPTS: ${aveAttempts}", 
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16, 
                          fontWeight: FontWeight.bold
                        )
                      )
                    )
                  )
                ]
              )
            )
          ),

          // BOTTOMBAR SECTION
          NextBar(
            title: "CONTINUE TO NEXT LEVEL",
            onNext: () {
              widget.onNext();
            } 
          ), 
        ]
      )
    );
  }
}