import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/helpers/globals.dart';
import 'package:four_pics_baybayin/state/ui-state.dart';

void goto(BuildContext context, Widget screen) {
  Future.delayed(Duration.zero, () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen)
    );
  });
}

void gotoPreviousScreen(BuildContext context) {
  Navigator.pop(context);
}

