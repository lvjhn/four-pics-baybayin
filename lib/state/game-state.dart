import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart'; 

class PuzzleState 
{
  late int puzzleNo; 
  late List<String> symbols;
  late List<String> input;

  PuzzleState(
    int puzzleNo, 
    List<String> symbols, 
    List<String> input
  );

  PuzzleState.fromJson(Map<String, dynamic> json)
      : puzzleNo = json['puzzleNo'] as int,
        symbols = json['symbols'] as List<String>, 
        input = json['input'] as List<String>;

  Map<String, dynamic> toJson() => {
    'puzzleNo': puzzleNo,
    'symbols' : symbols,
    'input'   : input 
  };
}

class PuzzlesState 
{
  late PuzzleState puzzleA; 
  late PuzzleState puzzleB; 
  late PuzzleState puzzleC;
  late PuzzleState puzzleD;

  PuzzlesState(
    PuzzleState puzzleA,
    PuzzleState puzzleB,
    PuzzleState puzzleC,
    PuzzleState puzzleD
  );

  PuzzlesState.fromJson(Map<String, dynamic> json)
      : puzzleA = json['puzzleA'] as PuzzleState,
        puzzleB = json['puzzleB'] as PuzzleState, 
        puzzleC = json['puzzleC'] as PuzzleState,
        puzzleD = json['puzzleD'] as PuzzleState;

  Map<String, dynamic> toJson() => {
    'puzzleA' : puzzleA,
    'puzzleB' : puzzleB,
    'puzzleC' : puzzleC, 
    'puzzleD' : puzzleD
  };
}

class GameState extends ChangeNotifier 
{
  PuzzlesState puzzles = PuzzlesState(
    PuzzleState(1, [""], [""]),
    PuzzleState(2, [""], [""]),
    PuzzleState(3, [""], [""]),
    PuzzleState(4, [""], [""])
  );

  int currentLevel = 1;

  void save() {
    final storage = GetStorage();
    storage.write("game-state", jsonEncode(puzzles));
    storage.write("current-level", currentLevel.toString());
  }

  void load() {
    final storage = GetStorage();
    puzzles = jsonDecode(storage.read("game-state")) as PuzzlesState;
    currentLevel = int.parse(storage.read("current-level"));
  }
}

var gameState = GameState();