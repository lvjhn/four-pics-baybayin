import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart'; 

class PuzzleProgress 
{   
  late int attempts;
  late String solvedOn; 

  PuzzleProgress(
    this.attempts,
    this.solvedOn
  );

  PuzzleProgress.fromJSON(Map<String, dynamic> json)
      : attempts = json['attempts'] as int,
        solvedOn = json['solvedOn'] as String;

  Map<String, dynamic> toJson() => {
    'attempts' : attempts,
    'solvedOn' : solvedOn
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
      progressDefaults.add(PuzzleProgress(0, "---"));
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
    if(storage.read("progress-state") == Null) {
      return;
    }
    save();
  }

  void clear() {
    final storage = GetStorage(); 
    storage.remove("progress-state"); 
  }

  void reset() {
    clear(); 
    init(); 
    save();
  }
}

var progressState = ProgressState();