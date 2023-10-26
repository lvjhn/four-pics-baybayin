import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart'; 

class PuzzleProgress 
{   
  late int attempts;
  late String solvedOn; 

  PuzzleProgress(
    int attempts,
    String solvedOn
  );

  PuzzleProgress.toJSON(Map<String, dynamic> json)
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
    List<PuzzleProgress> progress
  );
  
  PuzzleProgressesState.toJSON(Map<String, dynamic> json)
      : progress = json["progress"] as List<PuzzleProgress>;

  Map<String, dynamic> toJson() => {
    "progress" : progress
  };
}

class ProgressState extends ChangeNotifier
{
  late PuzzleProgressesState progressState;

  ProgressState() {
    List<PuzzleProgress> progressDefaults = [];

    for(int i = 0; i < 200; i++) {
      progressDefaults.add(PuzzleProgress(0, "---"));
    }

    progressState = PuzzleProgressesState(progressDefaults);
  }

  void save() {
    final storage = GetStorage();
    storage.write("progress-state", jsonEncode(progressState));
  }

  void load() {
    final storage = GetStorage();
    progressState = 
      jsonDecode(storage.read("progress-state")) as PuzzleProgressesState;
  }
}