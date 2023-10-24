import 'dart:async';

import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/components/bgi-box.dart';
import 'package:four_pics_baybayin/helpers/goto.dart';
import 'package:four_pics_baybayin/components/shrink-grow-animation.dart';
import 'package:four_pics_baybayin/screens/main-menu.dart';
import 'package:four_pics_baybayin/state/ui-state.dart';
import 'package:provider/provider.dart'; 

class SplashScreen extends StatefulWidget 
{
  const SplashScreen({super.key});

  @override 
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
{
  late Image logoImage; 
  late Widget logoText;
  
  startTime() async {
    var duration = const Duration(seconds: 5); 
    return Timer(duration, route); 
  }

  void route() {
    goto(context, const MainMenuScreen());
  }
  
  @override 
  void initState() {
    super.initState();
    startTime();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UIState>(
        builder: (context, uiState, child) {
          return BGIBox( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: createLogoText(context)),
                const SizedBox(height: 15),
                Center(child: createLogoImage(context))
              ]
            )
          );
        }
      )
    );
  } 
}

Widget createLogoText(BuildContext context) {
  return const Text(
    "4 PICS BAYBAYIN",
    style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      shadows: [
        Shadow(
          color: Colors.black,     
          blurRadius: 2.0,        
          offset: Offset(2.0, 2.0), 
        )
      ]
    )
  );
}

Widget createLogoImage(BuildContext context) {
  return ShrinkGrowAnimation(
    child: Image.asset("assets/logo/logo.png"),
    duration: 1000, 
    shrinkSize: 225,
    growSize: 250
  );
}

