import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/char-symbols/deko.dart';
import 'package:four_pics_baybayin/char-symbols/robotika.dart';
import 'package:four_pics_baybayin/char-symbols/sarimanok.dart';
import 'package:four_pics_baybayin/char-symbols/sejong.dart';
import 'package:four_pics_baybayin/char-symbols/sisil.dart';
import 'package:four_pics_baybayin/components/back-bar.dart';
import 'package:four_pics_baybayin/components/box-select.dart';
import 'package:four_pics_baybayin/components/custom-switch.dart';
import 'package:four_pics_baybayin/helpers/audio-player.dart';
import 'package:four_pics_baybayin/components/bgi-box.dart';
import 'package:four_pics_baybayin/components/game-bar.dart';
import 'package:four_pics_baybayin/state/ui-state.dart';
import 'package:provider/provider.dart'; 

class SettingsScreen extends StatefulWidget 
{
  const SettingsScreen({super.key});

  @override 
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen>
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
                const BackBar(title: "SETTINGS"),

                // MAIN SECTION
                Expanded( 
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const SizedBox(height: 20),
                      createEnableSoundsSection(context),
                      const SizedBox(height: 15), 
                      createBackgroundPatternSection(context),
                      const SizedBox(height: 15), 
                      createFontSelectionSection(context),
                      const SizedBox(height: 15),
                      createShowCharacterLabelsSection(context),
                      const SizedBox(height: 15), 
                      createResetGameDataSection(context)
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
}

Widget createSectionWrapper({ required Widget child }) {
  return Container(
    width: double.infinity, 
    margin: const EdgeInsets.symmetric(horizontal: 10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5)
    ),
    child: child  
  );
}

Widget createEnableSoundsSection(BuildContext context) {
  return createSectionWrapper(
    child: Row(
      children: [
        const Expanded(
          child: Text(
            "Enable Sounds",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            )
          )
        ), 
        CustomSwitch(
          isOn: uiState.flags["enableSoundEffects"]!,
          onChange: (bool isOn) {
            playSound("click-1");
            uiState.toggleFlag("enableSoundEffects");
          }
        )
      ]
    ) 
  );
}

Widget createBackgroundPatternSection(BuildContext context) {
  return createSectionWrapper(
    child:  Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Background Pattern",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )
              ),
              const SizedBox(height: 5),
              BoxSelect(
                activeItem: uiState.backgroundPattern,
                items: uiState.backgroundPatterns.map((backgroundPattern) {
                  return Image.asset(
                    backgroundPattern,
                    width: 100,
                    height: 100
                  );
                }).toList(),
                onChange: (int i) {
                  playSound("click-1");
                  uiState.setBackgroundPattern(i);
                }
              )
            ]
          )
        )
      ]
    ) 
  );
}

Widget createFontSelectionSection(BuildContext context) {
  return createSectionWrapper(
    child:  Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Tile Font",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ),
                  ElevatedButton(
                    onPressed: () {
                      playSound("click-1");
                    },
                    child: const Text("PREVIEW")
                  )
                ]
              ),
              const SizedBox(height: 5),
              BoxSelect(
                activeItem: uiState.tileFont,
                items: [
                  SisilCharSymbolNoLabels.createA(100, 100),  
                  DekoCharSymbolNoLabels.createA(100, 100),  
                  RobotikaCharSymbolNoLabels.createA(100, 100),
                  SarimanokCharSymbolNoLabels.createA(100, 100),
                  SejongCharSymbolNoLabels.createA(100, 100)
                ],
                onChange: (int i) {
                  playSound("click-1");
                  uiState.setTileFont(i);
                }
              )
            ]
          )
        )
      ]
    ) 
  );
}



Widget createShowCharacterLabelsSection(BuildContext context) {
  return createSectionWrapper(
    child: Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Show Character Labels",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )
              ),
              Text(
                "Show character label under symbols.",
                style: TextStyle(
                  fontSize: 12
                )
              )
            ]
          )
        ), 
        CustomSwitch(
          isOn: uiState.flags["showCharacterLabels"]!,
          onChange: (bool isOn) {
            playSound("click-1");
            uiState.toggleFlag("showCharacterLabels");
          }
        )
      ]
    ) 
  );
}

Widget createResetGameDataSection(BuildContext context) {
  return createSectionWrapper(
    child:  Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reset Game Data",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )
              ),
              Text(
                "Clear your progress and coins.",
                style: TextStyle(
                  fontSize: 12
                )
              )
            ]
          )
        ), 
        ElevatedButton(
          child: const Text("RESET"),
          onPressed: () {
            playSound("click-1");
          }
        )
      ]
    ) 
  );
}