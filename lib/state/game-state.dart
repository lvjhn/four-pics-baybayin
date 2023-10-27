import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/data/LevelDefinitions.dart';
import 'package:get_storage/get_storage.dart'; 

class PuzzleState 
{
  late int puzzleNo; 
  late List<String> symbols;
  late List<String> input;
  late List<int> locations;

  PuzzleState(
    this.puzzleNo, 
    this.symbols, 
    this.input,
    this.locations
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
            .map<int>((i) => int.parse(i))
            .toList();

  Map<String, dynamic> toJson() {
    return {
      "puzzleNo" : puzzleNo,
      'symbols'  : symbols,
      'input'    : input, 
      'locations' : locations
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
    coins = 100;
    puzzles = PuzzlesState(
      PuzzleState(1, [], [], []),
      PuzzleState(2, [], [], []),
      PuzzleState(3, [], [], []),
      PuzzleState(4, [], [], [])
    );
  }

  void setCurrentPuzzle(int puzzleNo) {
    currentPuzzle = puzzleNo;
    notifyListeners();
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
    return LevelDefinitions.levels[getCurrentPuzzleNo() - 1]["syllables"]!.split("-");
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
    "ya", "ye", "yo", "y" 
  ];

  String generateRandomSyllable() {
    return syllables[Random().nextInt(syllables.length)];
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
    preparePuzzleState(false, puzzles.puzzleA);
    preparePuzzleState(false, puzzles.puzzleB);
    preparePuzzleState(false, puzzles.puzzleC);
    preparePuzzleState(false, puzzles.puzzleD);
  }

  List<String> generateSymbolSet() {
    List<String> symbols = [];
    List<String> syllables = getCurrentSyllables();

    
    for(int i = 0; i < syllables.length; i++) {
      symbols.add(syllables[i]);
    }

    for(int i = syllables.length; i < 10; i++) {
      symbols.add(generateRandomSyllable());
    }

    symbols.shuffle();

    return symbols; 
  }

  void selectSymbol(int index, String character) {
    getCurrentPuzzleState().symbols[index] = "-";

    for(int i = 0; i < getCurrentPuzzleInput().length;i ++) {
      if(getCurrentPuzzleInput()[i] == "-") {
        getCurrentPuzzleState().input[i] = character;
        getCurrentPuzzleState().locations[i] = index;
        break;
      }
    }

    notifyListeners();
  }

  void removeInputCharacter(int index) {
    String character = getCurrentPuzzleInput()[index];
    getCurrentPuzzleState().input[index] = "-"; 
    int location = getCurrentPuzzleState().locations[index]; 
    getCurrentPuzzleState().symbols[location] = character;
    notifyListeners();
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
    if(storage.read("game-state") == Null &&
       storage.read("current-level") == Null && 
       storage.read("coins") == Null) {
      return;
    }
    save();
  }

  void clear() {
    final storage = GetStorage(); 
    storage.remove("game-state"); 
    storage.remove("current-level");
    storage.remove("coins");
  }

  void reset() {
    clear(); 
    init(); 
    save();
  }
}

var gameState = GameState();