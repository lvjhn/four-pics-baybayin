import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/components/backdrop/modal-container.dart';
import 'package:four_pics_baybayin/helpers/audio-player.dart';
import 'package:four_pics_baybayin/components/backdrop/bgi-box.dart';
import 'package:four_pics_baybayin/components/topbar/game-bar.dart';
import 'package:four_pics_baybayin/helpers/goto.dart';
import 'package:four_pics_baybayin/screens/level-selector.dart';
import 'package:four_pics_baybayin/state/ui-state.dart';
import 'package:provider/provider.dart'; 

class MainMenuScreen extends StatefulWidget 
{
  const MainMenuScreen({super.key});

  @override 
  State<MainMenuScreen> createState() => MainMenuScreenState();
}

class MainMenuScreenState extends State<MainMenuScreen>
{
  late Image logoImage; 

  List<int> durations = [500, 1000, 1500]; 
  
  @override 
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UIState>(
        builder: (context, uiState, child) {
          return BGIBox( 
            child: Column(
              children: [
                // GAMEBAR SECTION
                const GameBar(isHomeIconVisible: false),

                // MAIN SECTION
                Expanded( 
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      // --- TITLE + LOGO --- //
                      ...createTitleAndLogo(context),
                      const SizedBox(height: 50), 

                      // --- MAIN MENU BUTTONS --- // 
                      FadeIn(
                        animate: true,
                        duration:  Duration(milliseconds: durations[0]),
                        child: createPlayButton(context)
                      ),
                      const SizedBox(height: 10), 
                      FadeIn( 
                        animate: true, 
                        duration:  Duration(milliseconds: durations[1]), 
                        child: createProgressButton(context)
                      ),
                      const SizedBox(height: 10), 
                      FadeIn( 
                        animate: true, 
                        duration:  Duration(milliseconds: durations[2]),
                        child: createAboutButton(context)
                      )
                    ]
                  )
                )
              ] 
            )
          );
        }
      )
    );
  } 

  Widget createLogoText(BuildContext context) {
    return const Text(
      "4 PICS BAYBAYIN",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        shadows: [
          Shadow(
            color: Colors.black,     
            blurRadius: 2.0,        
            offset: Offset(2.0, 2.0), 
          )
        ]
      )
    );
  }

  List<Widget> createTitleAndLogo(BuildContext context) {
    return [
      Center(child: createLogoText(context)),
      const SizedBox(height: 15),
      Center(child: Image.asset("assets/logo/logo.png", width: 250)),
    ];
  }


  Widget createPlayButton(BuildContext context) {
    return SizedBox(
      width: 250, 
      height: 80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.yellowAccent
        ),
        child: Row(
          children: [
            Image.asset("assets/icons/icon-play.png", width: 50),
            const SizedBox(width: 35),
            const Text("PLAY", style: TextStyle(
              color: Colors.black,
              fontSize: 30
            ))
          ]
        ),   
        onPressed: () {
          debugPrint("Hello");
          playSound("click-1");
          goto(context, const LevelSelectorScreen());
        }
      )
    );
  }


  Widget createProgressButton(BuildContext context) {
    return SizedBox(
      width: 250, 
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: Colors.yellowAccent
        ),
        child: const Text("PROGRESS", style: 
          TextStyle(
            color: Colors.black,
            fontSize: 20
          )
        ),
        onPressed: () {
          playSound("click-1");
        }
      )
    );
  }


  Widget createAboutButton(BuildContext context) {
    return SizedBox(
      width: 250, 
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: Colors.yellowAccent
        ),
        child: const Text("ABOUT", style: 
          TextStyle(
            color: Colors.black,
            fontSize: 20
          )
        ),
        onPressed: () {
          playSound("click-1");
        }
      )
    );
  }
}
