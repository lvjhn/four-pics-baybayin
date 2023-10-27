import 'dart:core';

import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/helpers/globals.dart';
import 'package:four_pics_baybayin/helpers/reset-game-data.dart';
import 'package:four_pics_baybayin/screens/level-selector.dart';
import 'package:four_pics_baybayin/screens/main-game.dart';
import 'package:four_pics_baybayin/screens/main-menu.dart';
import 'package:four_pics_baybayin/screens/settings.dart';
import 'package:four_pics_baybayin/state/game-state.dart';
import 'package:four_pics_baybayin/state/progress-state.dart';
import 'package:get_storage/get_storage.dart'; 
import 'package:provider/provider.dart';
import 'package:four_pics_baybayin/helpers/load-image.dart';

import 'package:four_pics_baybayin/state/ui-state.dart';

import 'package:four_pics_baybayin/screens/splash.dart' 
  show SplashScreen;
import 'package:four_pics_baybayin/screens/_char-symbol-previewer.dart' 
  show CharSymbolPreviewerScreen;
import 'package:shared_preferences/shared_preferences.dart';

List<String> preloads = [
  "assets/icons/icon-back.png",
  "assets/icons/icon-check.png",
  "assets/icons/icon-close.png", 
  "assets/icons/icon-coin.png",
  "assets/icons/icon-home.png",
  "assets/icons/icon-image.png",
  "assets/icons/icon-info.png",
  "assets/icons/icon-left-arrow.png",
  "assets/icons/icon-lock.png",
  "assets/icons/icon-medal.png",
  "assets/icons/icon-open-box.png",
  "assets/icons/icon-play.png",
  "assets/icons/icon-right-arrow.png",
  "assets/icons/icon-settings.png", 
  "assets/icons/icon-star.png",
  "assets/icons/icon-switch.png"
];

Future<void> main() async {
  await GetStorage.init();

  resetGameData();

  gameState.preSave(); 
  progressState.preSave();

  uiState.loadSetings();
  progressState.load(); 
  gameState.load();

  // Preload Images
  WidgetsFlutterBinding.ensureInitialized();

  await loadImage(const AssetImage("assets/background-patterns/denim.webp"));
  await loadImage(const AssetImage("assets/logo/logo.png"));

  for(int i = 0; i < preloads.length; i++) {
    await loadImage(AssetImage(preloads[i]));
  }

  runApp(Root(key: root));
}

class Root extends StatefulWidget
{
  const Root({super.key});

  @override
  State<Root> createState() => RootState(); 
}

class RootState extends State<Root> 
{
  @override 
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => uiState),
        ChangeNotifierProvider(create: (context) => gameState),
        ChangeNotifierProvider(create: (context) => progressState)
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "Lexend"
        ),  
        home: const MainGameScreen( ) // uiState.currentScreen
      )
    );
  }
}