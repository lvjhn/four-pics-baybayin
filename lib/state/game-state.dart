import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/components/topbar/game-bar.dart';
import 'package:four_pics_baybayin/data/LevelDefinitions.dart';
import 'package:four_pics_baybayin/state/progress-state.dart';
import 'package:get_storage/get_storage.dart'; 

class PuzzleState 
{
  late int puzzleNo; 
  late List<String> symbols;
  late List<String> input;
  late List<int> locations;
  late List<bool> fixed;

  PuzzleState(
    this.puzzleNo, 
    this.symbols, 
    this.input,
    this.locations,
    this.fixed
  );

  PuzzleState.fromJson(Map<String, dynamic> json)
      : puzzleNo = json["puzzleNo"] as int,
        symbols = 
          List<dynamic>.from(json['symbols'])
            .map<String>((i) => i.toString())
            .toList(), 
        input = 
          List<dynamic>.from(json['input'])
            .map<String>((i) => i.toString())
            .toList(), 
        locations = 
          List<dynamic>.from(json['locations'])
            .map<int>((i) => int.parse(i.toString()))
            .toList(),
        fixed = 
          List<dynamic>.from(json['fixed'])
            .map<bool>((i) => bool.parse(i.toString()))
            .toList();

  Map<String, dynamic> toJson() {
    return {
      "puzzleNo" : puzzleNo,
      'symbols'  : symbols,
      'input'    : input, 
      'locations' : locations,
      'fixed'    : fixed
    };
  }
}

class PuzzlesState
{
  late PuzzleState puzzleA; 
  late PuzzleState puzzleB; 
  late PuzzleState puzzleC;
  late PuzzleState puzzleD;

  PuzzlesState(
    this.puzzleA,
    this.puzzleB,
    this.puzzleC,
    this.puzzleD
  );

  PuzzlesState.fromJson(Map<String, dynamic> json)
      : puzzleA = PuzzleState.fromJson(json["puzzleA"]),
        puzzleB = PuzzleState.fromJson(json["puzzleB"]), 
        puzzleC = PuzzleState.fromJson(json["puzzleC"]),
        puzzleD = PuzzleState.fromJson(json["puzzleD"]);

  Map<String, dynamic> toJson() => {
    'puzzleA' : puzzleA,
    'puzzleB' : puzzleB,
    'puzzleC' : puzzleC, 
    'puzzleD' : puzzleD
  };
}

class GameState extends ChangeNotifier 
{
  late PuzzlesState puzzles;

  late int currentLevel;
  late int coins;
  late int currentPuzzle;

  GameState() {
    init();
  }

  void init() {
    currentLevel = 1;
    currentPuzzle = 1;
    coins = 1000;
    puzzles = PuzzlesState(
      PuzzleState(1, [], [], [], []),
      PuzzleState(2, [], [], [], []),
      PuzzleState(3, [], [], [], []),
      PuzzleState(4, [], [], [], [])
    );
  }

  void setCurrentPuzzle(int puzzleNo) {
    currentPuzzle = puzzleNo;
  }

  int getPuzzleNo(int i) {
    return (currentLevel - 1) * 4 + (i + 1);
  } 

  int getCurrentPuzzleNo() {
    return getPuzzleNo(currentPuzzle);
  }

  String getCurrentWord() {
    return LevelDefinitions.levels[getCurrentPuzzleNo() - 1]["word"]!;
  }

  List<String> getCurrentSyllables() {
    return getSyllables(getCurrentPuzzleNo());
  }

  List<String> getSyllables(int puzzleNo) {

    debugPrint("Puzzle No: " + puzzleNo.toString());
    
    debugPrint("Puzzle No: " + LevelDefinitions.levels[puzzleNo - 1].toString());

    var syllables = 
      LevelDefinitions.levels[puzzleNo - 1]["syllables"]!.split("-");

    for(int i = 0; i < syllables.length; i++) {
      var syllable = syllables[i];
      if(syllable.length > 1 && syllable.substring(0, 2) == "ng") {
        syllables[i] = syllable.replaceFirst("ng", "N");
      }
    }

    return syllables;
  }

  PuzzleState getCurrentPuzzleState() {
    var currentPuzzleState;

    if(currentPuzzle == 0) {
      currentPuzzleState = gameState.puzzles.puzzleA;
    }
      
    else if(currentPuzzle == 1) {
      currentPuzzleState = gameState.puzzles.puzzleB;
    }

    else if(currentPuzzle == 2) {
      currentPuzzleState = gameState.puzzles.puzzleC;
    }

    else if(currentPuzzle == 3) {
      currentPuzzleState = gameState.puzzles.puzzleD;
    }

    return currentPuzzleState;
  }

  List<String> getCurrentPuzzleInput() {
    return getCurrentPuzzleState().input;
  }

  List<String> getCurrentPuzzleSymbols() {
    return getCurrentPuzzleState().symbols;
  }

  List<String> syllables = [
    "a", "e", "i", 
    "ba", "be", "bo", "b", 
    "ka", "ke", "ko", "k", 
    "da", "de", "do", "d", 
    "ga", "ge", "go", "g", 
    "ha", "he", "ho", "h", 
    "la", "le", "lo", "l", 
    "ma", "me", "mo", "m", 
    "na", "ne", "no", "n", 
    "Na", "Ne", "No", "N", 
    "pa", "pe", "po", "p", 
    "ra", "re", "ro", "r", 
    "sa", "se", "so", "s", 
    "ta", "te", "to", "t", 
    "wa", "we", "wo", "w", 
    "ya", "ye", "yo", "Y+" 
  ];

  String generateRandomSyllable() {
    return syllables[Random().nextInt(syllables.length)];
  }

  

  int countEmptySymbols() {
    int count = 0; 
    List<String> symbols = getCurrentPuzzleState().symbols;
    for(int i = 0; i < symbols.length; i++) {
      if(symbols[i] == "-") {
        count += 1;
      }
    }
    return count;
  }

  bool matchingSymbolsToSyllables() {
    List<String> syllables = getCurrentSyllables();
    List<String> symbols = getCurrentPuzzleState().symbols;
    for(int i = 0; i < symbols.length; i++) {
      if(symbols[i] == "-") continue;
      if(syllables.contains(symbols[i]) == false) {
        return false;
      }
    }
    return true;
  }

  void preparePuzzleState(bool notify, PuzzleState state) {
 
    PuzzleState puzzleState = state; 

    if(puzzleState.input.isEmpty) {
      puzzleState.input = [];
      puzzleState.locations = [];

      debugPrint("Current Syllables: " + getCurrentSyllables().toString());

      for(int i = 0; i < getCurrentSyllables().length; i++) {
        puzzleState.input.add("-");
        puzzleState.locations.add(-1);
        puzzleState.fixed.add(false);
      } 
      
      puzzleState.symbols = generateSymbolSet();
    }

    if(notify) {
      notifyListeners();
    }
  }

  bool isInputFilled() {
    for(int i = 0; i < getCurrentPuzzleInput().length; i++) {
      if(getCurrentPuzzleInput()[i] == "-") {
        return false;
      }
    }
    return true;
  }

  void preparePuzzleStates() {
    puzzles = PuzzlesState(
      PuzzleState(1, [], [], [], []),
      PuzzleState(2, [], [], [], []),
      PuzzleState(3, [], [], [], []),
      PuzzleState(4, [], [], [], [])
    );

    currentPuzzle = 0;
    preparePuzzleState(false, puzzles.puzzleA);
    currentPuzzle = 1;
    preparePuzzleState(false, puzzles.puzzleB);
    currentPuzzle = 2;
    preparePuzzleState(false, puzzles.puzzleC);
    currentPuzzle = 3;
    preparePuzzleState(false, puzzles.puzzleD);
  }

  void decreaseCoins(int amount, GlobalKey<GameBarState> gameBar) {
    coins -= amount; 
    gameBar.currentState?.coinSI?.currentState?.setValue(coins);
    Future.delayed(const Duration(milliseconds: 550), () {
      save();
      notifyListeners();
    });
  }

  void increaseCoins(int amount, GlobalKey<GameBarState> gameBar, bool notify) {
    coins += amount; 
    gameBar.currentState?.coinSI?.currentState?.setValue(coins);
    Future.delayed(const Duration(milliseconds: 550), () {
      save();
      if(notify) {
        notifyListeners();
      }
    });
  }

  int computeCurrentPuzzleReward() {
    int attempts = progressState.forCurrentPuzzle().attempts;
    return computeRewardForPuzzleAttempt(attempts);
  }

  List<String> generateSymbolSet() {
    List<String> symbols = [];
    List<String> syllables = getCurrentSyllables();

    debugPrint(syllables.toString());
    
    for(int i = 0; i < syllables.length; i++) {
      var syllable = syllables[i];
      symbols.add(syllable);
    }

    for(int i = syllables.length; i < 10; i++) {
      symbols.add(generateRandomSyllable());
    }

    symbols.shuffle();


    return symbols; 
  }

  void selectSymbol(
    int index, 
    String character, 
    { 
      bool toInput = true, 
      bool isFixed = false,
      int toSlot = -1
    }
  ) {
    getCurrentPuzzleState().symbols[index] = "-";

    if(toInput && toSlot != - 1) {
      getCurrentPuzzleState().input[toSlot] = character;
      getCurrentPuzzleState().locations[toSlot] = index;
      getCurrentPuzzleState().fixed[toSlot] = isFixed;
    }
    else if(toInput) {
      for(int i = 0; i < getCurrentPuzzleInput().length;i ++) {
        if(getCurrentPuzzleInput()[i] == "-") {
          getCurrentPuzzleState().input[i] = character;
          getCurrentPuzzleState().locations[i] = index;
          getCurrentPuzzleState().fixed[i] = isFixed;
          break;
        }
      }
    }

    inputWordsState.notifyListeners();
    save();
  }

  void removeInputCharacter(int index, { bool toSymbols = true }) {
    String character = getCurrentPuzzleInput()[index];
    getCurrentPuzzleState().input[index] = "-"; 
    if(toSymbols) {
      int location = getCurrentPuzzleState().locations[index]; 
      getCurrentPuzzleState().symbols[location] = character;
    }

    inputWordsState.notifyListeners();
    save();
  }

  String getWordForPuzzle(int puzzleNo) {
    return LevelDefinitions.levels[puzzleNo - 1]["word"]!.toUpperCase();
  }

  int computeRewardForPuzzleAttempt(int attempts) {
    if(attempts >= 10) {
      return 5;
    } else {
      return [
        50,
        45,
        40,
        35,
        30,
        25,
        20,
        15,
        10
      ][attempts - 1];
    }
  }

  int computeRewardForLevelAttempt(int averageAttempt) {
    return computeRewardForPuzzleAttempt(averageAttempt) * 4;
  }

  void moveToNextLevel(notify) {
    currentLevel += 1; 
    
    preparePuzzleStates();

    save();
    if(notify) {
      notifyListeners();
    }
  }

  void save() {
    final storage = GetStorage();
    storage.write("game-state", jsonEncode(puzzles));
    storage.write("current-level", currentLevel.toString());
    storage.write("coins", coins.toString());
  }

  void load() {
    final storage = GetStorage();
    
    var puzzlesMap = jsonDecode(storage.read("game-state"));
    puzzles = PuzzlesState.fromJson(puzzlesMap);

    currentLevel = int.parse(storage.read("current-level"));
    coins = int.parse(storage.read("coins"));
  }

  void preSave() {
    final storage = GetStorage();
    debugPrint("On gameState.preSave()");

    if(storage.read("game-state") == null ||
       storage.read("current-level") == null || 
       storage.read("coins") == null) {  
      debugPrint("Pre-saving...");
      save();
    }
  }

  void clear() {
    final storage = GetStorage(); 
    storage.remove("game-state"); 
    storage.remove("current-level");
    storage.remove("coins");
  }

  void reset(bool notify) {
    clear(); 
    init(); 
    save();
    if(notify) {
      notifyListeners();
    }
  }
}

class InputWordsState extends ChangeNotifier 
{
  
}

var inputWordsState = InputWordsState();
var gameState = GameState();