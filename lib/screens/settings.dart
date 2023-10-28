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
import 'package:four_pics_baybayin/components/topbar/back-bar.dart';
import 'package:four_pics_baybayin/components/general/box-select.dart';
import 'package:four_pics_baybayin/components/general/custom-switch.dart';
import 'package:four_pics_baybayin/components/backdrop/modal-container.dart';
import 'package:four_pics_baybayin/components/backdrop/modal-dialog.dart';
import 'package:four_pics_baybayin/helpers/audio-player.dart';
import 'package:four_pics_baybayin/components/backdrop/bgi-box.dart';
import 'package:four_pics_baybayin/components/topbar/game-bar.dart';
import 'package:four_pics_baybayin/helpers/goto.dart';
import 'package:four_pics_baybayin/helpers/reset-game-data.dart';
import 'package:four_pics_baybayin/screens/main-game.dart';
import 'package:four_pics_baybayin/screens/main-menu.dart';
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
  
  GlobalKey<ModalContainerState> mainModal = GlobalKey<ModalContainerState>();
  late Widget modalContent;

  List<int> durations = [500, 1000, 1500]; 
  
  @override 
  void initState() {
    super.initState();
    modalContent = createResetGameModal(context);
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
                  child: ModalContainer(
                    key: (() => mainModal)(),
                    modalContent: modalContent,
                    isShown: false,
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
                )
              ]
            )
          );
        }
      )
    );
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
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        backgroundPattern,
                        width: 100,
                        height: 100
                      )
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
                        setState(() { 
                          modalContent = createPreviewModal(context);
                          mainModal.currentState!.show();
                        });
                      },
                      child: const Text("PREVIEW")
                    )
                  ]
                ),
                const SizedBox(height: 5),
                BoxSelect(
                  activeItem: uiState.tileFont,
                  items: [
                    SisilCharSymbolNoLabels().createA(100, 100),  
                    DekoCharSymbolNoLabels().createA(100, 100),  
                    RobotikaCharSymbolNoLabels().createA(100, 100),
                    SarimanokCharSymbolNoLabels().createA(100, 100),
                    SejongCharSymbolNoLabels().createA(100, 100)
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
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red
            ),
            onPressed: () {
              playSound("click-1");
              setState(() {
                modalContent = createResetGameModal(context);
              });
              resetGameData(true);
              mainModal.currentState!.show();
            }
          )
        ]
      ) 
    );
  } 

  Widget createResetGameModal(BuildContext context) {
    return ModalDialog(
      width: 300, 
      title: "RESET GAME DATA",
      container: mainModal,
      showCloseIcon: false,
      child: Column(
        children: [
          Container( 
            margin: const EdgeInsets.all(14),
            child: const Text(
              "Are you sure you want to delete your game data?"
            ), 
          ),
          Container( 
            margin: const EdgeInsets.symmetric(horizontal: 14),
            child:  Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      playSound("click-1");
                      mainModal.currentState!.hide();
                    },
                    child: const Text("CANCEL"),
                  )
                ), 
                const SizedBox(width: 10),
                Expanded( 
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red
                    ),
                    onPressed: () {
                      playSound("click-1");
                      setState(() { 
                        modalContent = createResettedGameModal(context);
                      });
                    },
                    child: const Text("RESET"),
                  )
                )
              ]
            )
          ),
          const SizedBox(height: 14)
        ]
      )
    ); 
  }

  Widget createResettedGameModal(BuildContext context) {
  
    return ModalDialog(
      width: 300, 
      title: "SUCCESSFULLY RESET DATA",
      container: mainModal,
      child:  Container(
        margin: const EdgeInsets.all(14), 
        child: Column(
          children: [
            const Center(
              child: Text("Game data has been reset successfully.")
            ), 
            const SizedBox(height: 5),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  playSound("click-1");
                  goto(context, const MainMenuScreen());
                }, 
                child: const Text("OK, UNDERSTOOD.")
              )
            )
          ]
        )
      ),
    );
  }

  Widget createPreviewModal(BuildContext context) {
    CharSymbolBase currentTileSet = uiState.tilesets[uiState.tileFont][0];
    double size = 65;

    return ModalDialog(
      width: 300, 
      title: "PREVIEW",
      container: mainModal,
      child: Container(
        margin: const EdgeInsets.all(14), 
        child: Center(
          child: SizedBox(
            height: 340,
            child: Column(
              children: [
                Row(
                  children: [
                    currentTileSet.createA(size, size),
                    const SizedBox(width: 3),
                    currentTileSet.createEI(size, size),
                    const SizedBox(width: 3),
                    currentTileSet.createOU(size, size),
                    const SizedBox(width: 3),
                    currentTileSet.createNga(size, size)
                  ]
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    currentTileSet.createBa(size, size),
                    const SizedBox(width: 3),
                    currentTileSet.createKa(size, size),
                    const SizedBox(width: 3),
                    currentTileSet.createDa(size, size),
                    const SizedBox(width: 3),
                    currentTileSet.createGa(size, size)
                  ]
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    currentTileSet.createHa(size, size),
                    const SizedBox(width: 3),
                    currentTileSet.createLa(size, size),
                    const SizedBox(width: 3),
                    currentTileSet.createMa(size, size),
                    const SizedBox(width: 3),
                    currentTileSet.createNa(size, size)
                  ]
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    currentTileSet.createPa(size, size),
                    const SizedBox(width: 3),
                    currentTileSet.createRa(size, size),
                    const SizedBox(width: 3),
                    currentTileSet.createSa(size, size),
                    const SizedBox(width: 3),
                    currentTileSet.createTa(size, size)
                  ]
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    currentTileSet.createWa(size, size),
                    const SizedBox(width: 3),
                    currentTileSet.createYa(size, size),
                    const SizedBox(width: 3),
                    currentTileSet.createBeBi(size, size),
                    const SizedBox(width: 3),
                    currentTileSet.createBoBu(size, size),
                    const SizedBox(width: 3)
                  ]
                ),
                
              ]
            )
          )
        )
      )
    );
  }

}
