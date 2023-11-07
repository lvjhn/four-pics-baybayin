import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/helpers/globals.dart';
import 'package:four_pics_baybayin/state/ui-state.dart';

void goto(BuildContext context, Widget screen, { bool replace = false }) {
  if(replace) {
    Future.delayed(Duration.zero, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => screen)
      );
    });
  } else {
    Future.delayed(Duration.zero, () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => screen)
      );
    });
  }
}

void gotoPreviousScreen(BuildContext context) {
  Navigator.of(context).pop();
}

