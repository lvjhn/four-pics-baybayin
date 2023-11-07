import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/state/game-state.dart';
import 'package:get_storage/get_storage.dart'; 

class PuzzleProgress 
{   
  late int attempts;
  late String solvedOn;
  late bool isSolved; 

  PuzzleProgress(
    this.attempts,
    this.solvedOn,
    this.isSolved
  );

  PuzzleProgress.fromJSON(Map<String, dynamic> json)
      : attempts = json['attempts'] as int,
        solvedOn = json['solvedOn'] as String,
        isSolved = json['isSolved'] as bool;

  Map<String, dynamic> toJson() => {
    'attempts' : attempts,
    'solvedOn' : solvedOn, 
    'isSolved' : isSolved
  };
}

class PuzzleProgressesState
{
  late List<PuzzleProgress> progress; 

  PuzzleProgressesState(
    this.progress
  );
  
  PuzzleProgressesState.fromJSON(Map<String, dynamic> json)
      : progress =  
        List<dynamic>.from(json['progress'])
            .map<PuzzleProgress>((i) => PuzzleProgress.fromJSON(i))
            .toList();

  Map<String, dynamic> toJson() => {
    "progress" : progress
  };
}

class ProgressState extends ChangeNotifier
{
  late PuzzleProgressesState progressState;

  ProgressState() {
    init();
  }


  void init() {
    List<PuzzleProgress> progressDefaults = [];

    for(int i = 0; i < 200; i++) {
      progressDefaults.add(PuzzleProgress(0, "---", false));
    }

    progressState = PuzzleProgressesState(progressDefaults);
  }

  void increaseAttempt(bool notify, int puzzleNo) {
    debugPrint("Increasing attempts");
    progressState.progress[puzzleNo - 1].attempts += 1; 
    if(notify) {
      notifyListeners();
    }
  }

  void markAsSolved(int puzzleNo) {
    PuzzleProgress state = forPuzzle(puzzleNo);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    state.isSolved = true;
    state.solvedOn = formattedDate;
    save();
    notifyListeners();
  }

  int countCompletedInLevel() {
    int level = gameState.currentLevel;

    int puzzleANo = (level - 1) * 4 + 1;
    int puzzleBNo = (level - 1) * 4 + 2;
    int puzzleCNo = (level - 1) * 4 + 3;
    int puzzleDNo = (level - 1) * 4 + 4;

    PuzzleProgress puzzleA = forPuzzle(puzzleANo);
    PuzzleProgress puzzleB = forPuzzle(puzzleBNo);
    PuzzleProgress puzzleC = forPuzzle(puzzleCNo);
    PuzzleProgress puzzleD = forPuzzle(puzzleDNo);

    final states = [puzzleA, puzzleB, puzzleC, puzzleD]; 
    int count = 0; 

    for(int i = 0; i < states.length; i++) {
      if(states[i].isSolved) {
        count += 1;
      }
    }

    return count;
  }

  PuzzleProgress forCurrentPuzzle() {
    return forPuzzle(gameState.getCurrentPuzzleNo());
  }

  PuzzleProgress forPuzzle(int puzzleNo) {
    return progressState.progress[puzzleNo - 1];
  }

  int computeLevelAverageAttempts(int level) {
    int puzzleANo = (level - 1) * 4 + 1;
    int puzzleBNo = (level - 1) * 4 + 2;
    int puzzleCNo = (level - 1) * 4 + 3;
    int puzzleDNo = (level - 1) * 4 + 4;

    PuzzleProgress puzzleA = forPuzzle(puzzleANo);
    PuzzleProgress puzzleB = forPuzzle(puzzleBNo);
    PuzzleProgress puzzleC = forPuzzle(puzzleCNo);
    PuzzleProgress puzzleD = forPuzzle(puzzleDNo);

    final states = [puzzleA, puzzleB, puzzleC, puzzleD]; 
    int sum = 0; 

    for(int i = 0; i < states.length; i++) {
      if(states[i].isSolved) {
        sum += states[i].attempts;
      }
    }

    return (sum / 4).ceil().toInt();
  }


  void save() {
    final storage = GetStorage();
    storage.write("progress-state", jsonEncode(progressState));
  }

  void load() {
    final storage = GetStorage();

    var progressStateMap = 
      jsonDecode(storage.read("progress-state")) as Map<String, dynamic>;
    progressState =  
      PuzzleProgressesState.fromJSON(progressStateMap); 
  }

  void preSave() {
    final storage = GetStorage();
    debugPrint("On progressState.preSave()");
    

    if(storage.read("progress-state") == null) {
      debugPrint("Pre-saving...");
      save();
    }
  }

  void clear() {
    final storage = GetStorage(); 
    storage.remove("progress-state"); 
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

var progressState = ProgressState();