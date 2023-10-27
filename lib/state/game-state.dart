import 'dart:convert';

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
    return LevelDefinitions.levels[currentLevel]["word"]!;
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

  void preparePuzzleState(bool notify) {
    PuzzleState puzzleState = getCurrentPuzzleState(); 
    if(puzzleState.input.isEmpty) {
      puzzleState.symbols = [
        "-", "bo", "i", "ga", "-", 
        "da", "me", "-", "de", "la"
      ];
      puzzleState.input = ["i", "-", "da"];
      puzzleState.locations = [-1, -1, -1];
    }
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