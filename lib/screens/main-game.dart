import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/components/backdrop/bgi-box.dart';
import 'package:four_pics_baybayin/components/backdrop/modal-container.dart';
import 'package:four_pics_baybayin/components/backdrop/modal-dialog.dart';
import 'package:four_pics_baybayin/components/bottombar/bottom-back-bar.dart';
import 'package:four_pics_baybayin/components/general/four-images.dart';
import 'package:four_pics_baybayin/components/main-game/input-word.dart';
import 'package:four_pics_baybayin/components/main-game/other-controls.dart';
import 'package:four_pics_baybayin/components/main-game/symbol-selector.dart';
import 'package:four_pics_baybayin/components/topbar/game-bar.dart';
import 'package:four_pics_baybayin/data/CharacterDefinitions.dart';
import 'package:four_pics_baybayin/data/LevelDefinitions.dart';
import 'package:four_pics_baybayin/helpers/audio-player.dart';
import 'package:four_pics_baybayin/screens/level-selector.dart';
import 'package:four_pics_baybayin/state/game-state.dart';
import 'package:four_pics_baybayin/state/progress-state.dart';
import 'package:four_pics_baybayin/state/ui-state.dart';
import 'package:provider/provider.dart';

class MainGameScreen extends StatefulWidget 
{
  const MainGameScreen({super.key});

  @override 
  State<MainGameScreen> createState() => MainGameScreenState();
}

class MainGameScreenState extends State<MainGameScreen>
  with AutomaticKeepAliveClientMixin
{
  @override
  bool get wantKeepAlive => true; 

  GlobalKey<ModalContainerState> mainModal = GlobalKey<ModalContainerState>();
  late Widget modalContent;
  
  @override 
  void initState() {
    super.initState();
    modalContent = createRemoveAllCharactersModal(context);
  }

  Widget showGameLayers(BuildContext context) {
    return Stack(
      children: [
        createMainLayer()
      ]
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer3<UIState, GameState, ProgressState>(
        builder: (context, uiState, gameState, progressState, child) {
          return BGIBox( 
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // GAMEBAR SECTION
                    const GameBar(isHomeIconVisible: true),

                    // MAIN GAME SECTION 
                    Expanded(
                      child: ModalContainer(
                        key: mainModal, 
                        modalContent: modalContent,
                        isShown: false,
                        child: showGameLayers(context)
                      )
                    )
                  ]
                )
              ]
            )
          );
        }
      )
    );
  } 

  Widget createHeaderSection(BuildContext context) {
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
                            child: Container(
                              child: const Center(
                                child: Text(
                                  "PUZZLES 1-4",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                  )
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
                                    child: const Center(
                                      child: Text(
                                        "5",
                                        style: TextStyle(
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
                        "assets/icons/icon-open-box.png", 
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
  
  Widget createCompletionIndicator(BuildContext context) {
    return Positioned(
      top: 220, 
      left: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.transparent
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 4,
                    offset: Offset(0, 3), // changes position of shadow
                  )   
                ]
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25)
                      )
                    ),
                    child: const Text("2/4")
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5
                      ),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(20, 20, 20, 1.0),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25)
                        )
                      ),
                      child: const Center(
                        child: Text(
                          "COMPLETED",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14
                          )
                        )
                      )
                    )
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }

  Widget createRemoveAllCharactersModal(BuildContext context) {
    return ModalDialog(
      width: 300, 
      title: "SUCCESSFULLY RESET DATA",
      container: mainModal,
      child:  Container(
        margin: const EdgeInsets.all(14), 
        child: const Center(
          child: Text("Game data has been reset successfully.")
        )
      ),
    );
  }

  Widget createMainLayer() {
  
    gameState.preparePuzzleState(false);

    int puzzleNo = 
      gameState.getCurrentPuzzleNo();
    
    String currentWord = 
      gameState.getCurrentWord();

    debugPrint("Current Puzzle: " + gameState.currentPuzzle.toString());
    debugPrint("Current Word: " + currentWord);

    String syllablesString = 
      LevelDefinitions.levels[gameState.getCurrentPuzzleNo() - 1]["syllables"]!;

    List<String> correctSyllables = syllablesString.split("-");
    List<String> currentPuzzleInput = gameState.getCurrentPuzzleInput(); 
    List<String> currentSymbols = gameState.getCurrentPuzzleSymbols();

    GlobalKey<InputWordState> inputWord = GlobalKey<InputWordState>();

    debugPrint(currentPuzzleInput.toString());
  
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // IMAGE SECTION
              FourImages(
                image1: "assets/puzzles/$puzzleNo.1-$currentWord.jpeg", 
                image2: "assets/puzzles/$puzzleNo.2-$currentWord.jpeg", 
                image3: "assets/puzzles/$puzzleNo.3-$currentWord.jpeg", 
                image4: "assets/puzzles/$puzzleNo.4-$currentWord.jpeg", 
                width: 280
              ), 

              const SizedBox(height: 40),

              // INPUT WORD 
              InputWord(
                key: inputWord,
                tileFont: uiState.getCurrentTileFont(),
                correct: correctSyllables, 
                current: currentPuzzleInput,
                locations: [6, -1, 2], 
                onRemove: (int index, String character, int location) {
                  debugPrint("Removing character $location -> $character from input.");
                  gameState.removeInputCharacter(index);
                },
                onCorrect: () {

                },
                onInvalid: () {

                }, 
              ), 

              // ElevatedButton(
              //   onPressed: () {
              //     playSound("error");
              //     inputWord.currentState?.shake();
              //   }, 
              //   child: const Text("Shake Input Word")
              // ), 

              const SizedBox(height: 60),

              // SYMBOL SELECTION 
              SymbolSelector(
                tileFont: uiState.getCurrentTileFont(),
                characters: currentSymbols,
                onSelect: (int i, String character) {
                  debugPrint("Selecting symbol $i -> $character");
                  gameState.selectSymbol(i, character);
                }
              ), 

              const SizedBox(height: 20),

              // OTHER CONTROLS 
              OtherControls(
                onRemoveExtraCharacter: () {
                  debugPrint("Removing extra character."); 
                }, 
                onRevealACharacter: () {
                  debugPrint("Revealing a character.");
                }, 
                onRemoveExtraCharacters: () {
                  debugPrint("Removing extra characters.");
                }
              )
            ]
          )
        ),

        // BOTTOMBAR SECTION
        const BottomBackBar(
          title: "BACK TO LEVEL SELECTION SCREEN",
          target: LevelSelectorScreen(), 
        ) 
      ]
  );

  }
}
