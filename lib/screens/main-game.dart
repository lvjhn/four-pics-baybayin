import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/components/backdrop/bgi-box.dart';
import 'package:four_pics_baybayin/components/backdrop/modal-container.dart';
import 'package:four_pics_baybayin/components/backdrop/modal-dialog.dart';
import 'package:four_pics_baybayin/components/bottombar/bottom-back-bar.dart';
import 'package:four_pics_baybayin/components/general/four-images.dart';
import 'package:four_pics_baybayin/components/main-game/cost-specifier.dart';
import 'package:four_pics_baybayin/components/main-game/hint-modal.dart';
import 'package:four_pics_baybayin/components/main-game/input-word.dart';
import 'package:four_pics_baybayin/components/main-game/level-done.dart';
import 'package:four_pics_baybayin/components/main-game/other-controls.dart';
import 'package:four_pics_baybayin/components/main-game/puzzle-solved.dart';
import 'package:four_pics_baybayin/components/main-game/symbol-selector.dart';
import 'package:four_pics_baybayin/components/topbar/game-bar.dart';
import 'package:four_pics_baybayin/data/CharacterDefinitions.dart';
import 'package:four_pics_baybayin/data/LevelDefinitions.dart';
import 'package:four_pics_baybayin/helpers/audio-player.dart';
import 'package:four_pics_baybayin/helpers/goto.dart';
import 'package:four_pics_baybayin/screens/level-selector.dart';
import 'package:four_pics_baybayin/screens/main-menu.dart';
import 'package:four_pics_baybayin/state/game-state.dart';
import 'package:four_pics_baybayin/state/progress-state.dart';
import 'package:four_pics_baybayin/state/ui-state.dart';
import 'package:provider/provider.dart';

class MainGameScreen extends StatefulWidget 
{
  const MainGameScreen({
    super.key,
    this.overlayLayer = "<hidden>"
  });

  final String overlayLayer;

  @override 
  State<MainGameScreen> createState() => MainGameScreenState();
}

class MainGameScreenState extends State<MainGameScreen>
{
  GlobalKey<ModalContainerState> mainModal = GlobalKey<ModalContainerState>();
  late Widget modalContent;

  var gameBar = GlobalKey<GameBarState>();
  late String overlayLayer;
  
  GlobalKey<InputWordState> inputWord = GlobalKey<InputWordState>();

  @override 
  void initState() {
    super.initState();
    modalContent = createRemoveExtraCharacterModal(context);
    overlayLayer = widget.overlayLayer;
  }

  Widget showGameLayers(BuildContext context) {
    return Stack(
      children: [
        createMainLayer(),
        createOverlayLayer()
      ]
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<UIState, GameState>(
        builder: (context, uiState, gameState, child) {
          return BGIBox( 
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // GAMEBAR SECTION
                    GameBar(key: gameBar, isHomeIconVisible: true),

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


  void removeExtraCharacter() {
    debugPrint("Removing extra character...");

    // List<String> input = gameState.getCurrentPuzzleState().input;
    // List<String> syllables = gameState.getCurrentSyllables();
    // List<String> symbols = gameState.getCurrentPuzzleState().symbols;
    // List<int> validIndices = [];
    
    // for(int i = 0; i < symbols.length; i++) {
    //   String symbol = symbols[i];
    //   debugPrint("Checking $symbol...");
    //   if(symbol != "-" && syllables.contains(symbol) == false) {
    //     validIndices.add(i);
    //   }
    // }

    // debugPrint("Syllables: " + syllables.toString());
    // debugPrint("Symbols: " + symbols.toString());
    // debugPrint("Valid indices: " + validIndices.toString());
    // int removeIndex = validIndices[Random().nextInt(validIndices.length)];
    // gameState.selectSymbol(removeIndex, symbols[removeIndex], toInput: false );

    List<String> input     = gameState.getCurrentPuzzleInput(); 
    List<String> syllables = gameState.getCurrentSyllables(); 
    List<String> symbols   = gameState.getCurrentPuzzleSymbols(); 

    List<int> inputVI   = []; 
    List<int> symbolsVI = []; 

    /** Probe Input for Indices to Remove */
    for(int i = 0; i < input.length; i++) {
      String inputSyllable = input[i]; 
      if(inputSyllable != "-" && syllables.contains(inputSyllable) == false) {
        inputVI.add(i); 
      }
    }

    /** Probe Symbols for Indices to Remove */
    for(int i = 0; i < symbols.length; i++) {
      String symbolSyllable = symbols[i]; 
      if(symbolSyllable != "-" && syllables.contains(symbolSyllable) == false) {
        symbolsVI.add(i); 
      }
    }

    debugPrint("Input: " + inputVI.toString());
    debugPrint("Symbols: " + symbolsVI.toString());

    /** Identify which set to remove from */
    int set;
    
    if(inputVI.isNotEmpty && symbolsVI.isEmpty) {
      set = 0;
    }
    else if(inputVI.isEmpty && symbolsVI.isNotEmpty) {
      set = 1;
    } 
    else {
      set = Random().nextInt(1);
    }

    if(set == 0) {
      int index = inputVI[Random().nextInt(inputVI.length)];
      debugPrint("@ input $index");
      gameState.removeInputCharacter(index, toSymbols: false);
    } else if (set == 1) {
      int index = symbolsVI[Random().nextInt(symbolsVI.length)];
      debugPrint("@ symbols $index");
      gameState.selectSymbol(index, symbols[index], toInput: false);
    }

    submitInput();
  }
  
  void revealACharacter() {
    debugPrint("Revealing a character...");
    
    // List<String> input = gameState.getCurrentPuzzleState().input;
    // List<String> syllables = gameState.getCurrentSyllables();
    // List<String> symbols = gameState.getCurrentPuzzleState().symbols;

    // List<int> validIndices = [];

    // for(int i = 0; i < symbols.length; i++) {
    //   String symbol = symbols[i];
    //   debugPrint("Checking $symbol...");
    //   if(syllables.contains(symbol) == true && input.contains(symbol) == false) {
    //     validIndices.add(i);
    //   }
    // }

    // int removeIndex = validIndices[Random().nextInt(validIndices.length)];

    // int slotIndex = -1; 

    // for(int i = 0; i < syllables.length; i++) {
    //   if(syllables[i] == symbols[removeIndex]) {
    //     slotIndex = i;
    //   }
    // }

    // gameState.selectSymbol(
    //   removeIndex, 
    //   symbols[removeIndex], 
    //   toInput: true, 
    //   isFixed: true, 
    //   toSlot: slotIndex
    // );
    
    // gameState.selectSymbol(removeIndex, symbols[removeIndex], toInput: false);
    // gameState.removeInputCharacter(removeIndex);

    List<String> input     = gameState.getCurrentPuzzleInput(); 
    List<String> syllables = gameState.getCurrentSyllables(); 
    List<String> symbols   = gameState.getCurrentPuzzleSymbols(); 

    List<int> symbolsVI = []; 
    
    /** Pick which symbol to reveal. */
    List<int> inputVI = [];

    for(int i = 0; i < input.length; i++) {
      String inputSyllable = input[i]; 
      if(inputSyllable == "-") {
        inputVI.add(i);
      }
    }

    debugPrint("Input VI: $symbolsVI");

    int removeIndex = inputVI[Random().nextInt(inputVI.length)];
    String removeSyllable = syllables[removeIndex]; 
    
    debugPrint("Remove Index: $removeIndex");
    debugPrint("Remove Syllable: $removeSyllable");

    /** 
     * Find first instance of syllable to remove in the symbol set and
     * remove it.
     */
    for(int i = 0; i < symbols.length; i++) {
      String symbolSyllable = symbols[i]; 
      if(symbolSyllable == removeSyllable) {
        gameState.selectSymbol(
          i, 
          symbolSyllable, 
          toInput: true,
          toSlot: removeIndex,
          isFixed: true
        );
        break;
      }
    }

    submitInput();
  }

  void removeExtraCharacters() {
    // debugPrint("Removing extra characters..");
    // List<String> input = gameState.getCurrentPuzzleState().input;
    // List<String> syllables = gameState.getCurrentSyllables();
    // List<String> symbols = gameState.getCurrentPuzzleState().symbols;
    // List<int> validIndices = [];

    // for(int i = 0; i < symbols.length; i++) {
    //   String symbol = symbols[i];
    //   debugPrint("Checking $symbol...");
    //   if(symbol != "-" && syllables.contains(symbol) == false) {
    //     validIndices.add(i);
    //   }
    // }

    // debugPrint(validIndices.toString());

    // for(int i = 0; i < validIndices.length; i++) {
    //   gameState.selectSymbol(validIndices[i], symbols[i], toInput: false );
    // }
    
    // submitInput();

    List<String> input     = gameState.getCurrentPuzzleInput(); 
    List<String> syllables = gameState.getCurrentSyllables(); 
    List<String> symbols   = gameState.getCurrentPuzzleSymbols(); 

    List<int> inputVI   = []; 
    List<int> symbolsVI = []; 

    /** Probe Input for Indices to Remove */
    for(int i = 0; i < input.length; i++) {
      String inputSyllable = input[i]; 
      if(inputSyllable != "-" && syllables.contains(inputSyllable) == false) {
        inputVI.add(i); 
      }
    }

    /** Probe Symbols for Indices to Remove */
    for(int i = 0; i < symbols.length; i++) {
      String symbolSyllable = symbols[i]; 
      if(symbolSyllable != "-" && syllables.contains(symbolSyllable) == false) {
        symbolsVI.add(i); 
      }
    }

    debugPrint("Input: " + inputVI.toString());
    debugPrint("Symbols: " + symbolsVI.toString());

    /** Remove Symbols from Input Set */
    for(int i = 0; i < inputVI.length; i++) {
      int index = inputVI[i];
      gameState.removeInputCharacter(index, toSymbols: false);
    }

    /** Remove Symbols from Symbols Set */
    for(int i = 0; i < symbolsVI.length; i++) {
      int index = symbolsVI[i];
      gameState.selectSymbol(index, symbols[index], toInput: false);
    }

    submitInput();
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

  Widget createRemoveExtraCharacterModal(BuildContext context) {
    return HintModal(
      title: "REMOVE EXTRA CHARACTER", 
      description: "This will remove a character from the set that is not in the word.",
      container: mainModal,
      cost: 50, 
      mainAction: () { removeExtraCharacter(); }, 
      gameBar: gameBar
    );
  }

  Widget createRevealACharacterModal(BuildContext context) {
    return HintModal(
      title: "REVEAL A CHARACTER", 
      description: "This will reveal a character that is in the word.",
      container: mainModal,
      cost: 150, 
      mainAction: () { revealACharacter(); }, 
      gameBar: gameBar
    );
  }

  Widget createRemoveExtraCharactersModal(BuildContext context) {
    return HintModal(
      title: "REMOVE EXTRA CHARACTERS", 
      description: "This will remove extra characters from the set that is in the word.",
      container: mainModal,
      cost: 300, 
      mainAction: () { removeExtraCharacters(); }, 
      gameBar: gameBar
    );
  }

  
  void submitInput() {
    int puzzleNo = gameState.getCurrentPuzzleNo();

    if(gameState.isInputFilled()) {
      if(progressState.forCurrentPuzzle().attempts == 0) {
        progressState.increaseAttempt(true, puzzleNo);
      } else {
        progressState.increaseAttempt(true, puzzleNo);
      }

      if(inputWord.currentState?.isCorrect() == false) {
        inputWord.currentState?.shake();
        playSound("error");
      } 
      
      else {
        int attempts = progressState.forCurrentPuzzle().attempts;
        int reward = gameState.computeRewardForPuzzleAttempt(attempts);

        debugPrint("Claimed reward $reward for $attempts attempts.");

        playSound("solved");
        setState(() { overlayLayer = "puzzle-solved"; });
        gameState.increaseCoins(
          reward, 
          gameBar,
          false
        );
        progressState.markAsSolved(puzzleNo);
      }

    }
  }

  
  Widget createMainLayer() {
  
    gameState.preparePuzzleState(false, gameState.getCurrentPuzzleState());

    int puzzleNo = 
      gameState.getCurrentPuzzleNo();
    
    String currentWord = 
      gameState.getCurrentWord();

    List<String> correctSyllables = gameState.getCurrentSyllables();
    List<String> currentPuzzleInput = gameState.getCurrentPuzzleInput(); 
    List<String> currentSymbols = gameState.getCurrentPuzzleSymbols();
    

    final locations = gameState.getCurrentPuzzleState().locations;

    debugPrint("Current Syllables: " + correctSyllables.toString());
    debugPrint("Current Input: " + currentPuzzleInput.toString());
    debugPrint("Current Symbols: " + currentSymbols.toString());

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
                width: 280,
                selectable: true,
              ), 

              const SizedBox(height: 40),

              Consumer<InputWordsState>(
                builder: (context, inputWordsState, child) {
                  return Column(
                    children: [
                      InputWord(
                        key: inputWord,
                        tileFont: uiState.getCurrentTileFont(),
                        locations: locations, 
                        onRemove: (int index, String character, int location) {
                          debugPrint("Removing character $location -> $character from input.");
                          gameState.removeInputCharacter(index);
                        }
                      ),
                      const SizedBox(height: 60),
                      SymbolSelector(
                        tileFont: uiState.getCurrentTileFont(),
                        onSelect: (int i, String character) {
                          debugPrint("Selecting symbol $i -> $character");
                          gameState.selectSymbol(i, character);
                          debugPrint(gameState.getCurrentPuzzleState().fixed.toString());
                          submitInput();
                        }
                      )
                    ]
                  );
                }
              ), 

              const SizedBox(height: 20),

              // // INPUT WORD 
              // Consumer<InputWordsState>(
              //   builder: (context, inputWordsState, child) {
              //     return InputWord(
              //       key: inputWord,
              //       tileFont: uiState.getCurrentTileFont(),
              //       locations: locations, 
              //       onRemove: (int index, String character, int location) {
              //         debugPrint("Removing character $location -> $character from input.");
              //         gameState.removeInputCharacter(index);
              //       }
              //     );
              //   }
              // ), 

              // const SizedBox(height: 60),

              // // SYMBOL SELECTION 
              // Consumer<InputWordsState>(
              //   builder: (context, inputWordsState, child) {
              //     return SymbolSelector(
              //       tileFont: uiState.getCurrentTileFont(),
              //       onSelect: (int i, String character) {
              //         debugPrint("Selecting symbol $i -> $character");
              //         gameState.selectSymbol(i, character);
              //         debugPrint(gameState.getCurrentPuzzleState().fixed.toString());
              //         submitInput();
              //       }
              //     );
              //   }
              // ),

         

              // OTHER CONTROLS 
              Consumer<ProgressState>(
                builder: (context, progressState, children) { 
                  return OtherControls(
                    onRemoveExtraCharacter: () {
                      debugPrint("Removing extra character.");
                      setState(() {
                        modalContent = createRemoveExtraCharacterModal(context);
                        mainModal.currentState?.show(); 
                      }); 
                    }, 
                    onRevealACharacter: () {
                      debugPrint("Revealing a character.");
                      setState(() {
                        modalContent = createRevealACharacterModal(context); 
                        mainModal.currentState?.show(); 
                      });
                    }, 
                    onRemoveExtraCharacters: () {
                      debugPrint("Removing extra characters.");
                      setState(() {
                        modalContent = createRemoveExtraCharactersModal(context);
                        mainModal.currentState?.show(); 
                      });
                    },
                    
                    attempts: progressState.progressState.progress[puzzleNo - 1].attempts,
                    
                    enableRemoveExtraCharacter: (() {
                      int noEmptySymbols = gameState.countEmptySymbols();
                      List<String> syllables = gameState.getCurrentSyllables();
                      
                      bool minimalSymbols = 10 - noEmptySymbols < syllables.length;
                      bool matchingCharsets = gameState.matchingSymbolsToSyllables();
                      

                      if(matchingCharsets || minimalSymbols) {
                        return false;
                      } else{
                        return true;
                      }
                    })(),

                    enableRevealACharacter: (() {
                      List<String> syllables = gameState.getCurrentSyllables();
                      List<String> input = gameState.getCurrentPuzzleInput();
                      return !listEquals(syllables, input);
                    })(),

                    enableRemoveAllCharacters: (() {
                      int noEmptySymbols = gameState.countEmptySymbols();
                      List<String> syllables = gameState.getCurrentSyllables();
                      
                      bool minimalSymbols = 10 - noEmptySymbols < syllables.length;
                      bool matchingCharsets = gameState.matchingSymbolsToSyllables();
                      

                      if(matchingCharsets || minimalSymbols) {
                        return false;
                      } else{
                        return true;
                      }
                    })()
                  ); 
                }
              )
            ]
          )
        ),

        // BOTTOMBAR SECTION
        const BottomBackBar(
          title: "BACK TO LEVEL SELECTION SCREEN",
          target: LevelSelectorScreen(),
          replace: true 
        ), 

        // DEV. ONLY CONTROLS
        // Row(
        //   children: [
        //     ElevatedButton( 
        //       onPressed: () {
        //         gameState.decreaseCoins(50, gameBar);
        //       },
        //       child: const Text("-")
        //     ),
        //     ElevatedButton( 
        //       onPressed: () {
        //         gameState.increaseCoins(50, gameBar);
        //       },
        //       child: const Text("+")
        //     )
        //   ]
        // )
      ]
    );
  }

  Widget createOverlayLayer() {
    if(overlayLayer == "puzzle-solved") {
      return createPuzzleSolvedLayer();
    } 
    else if(overlayLayer == "level-done") {
      return createLevelDoneLayer();
    }
    else {
      return const Text("");
    }
  } 

  Widget createPuzzleSolvedLayer() {
    return PuzzleSolved(
      onNext: () {
        goto(context, const LevelSelectorScreen(), replace: true);
      }
    );
  }

  Widget createLevelDoneLayer() {
    return  LevelDone(
      onNext: () {
        debugPrint("Moving on to the next level...");
        gameState.moveToNextLevel(false);
        goto(context, const LevelSelectorScreen(), replace: true);
      }
    );
  }
}
