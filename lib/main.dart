import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/helpers/globals.dart';
import 'package:four_pics_baybayin/screens/main-menu.dart';
import 'package:four_pics_baybayin/screens/settings.dart'; 
import 'package:provider/provider.dart';
import 'package:four_pics_baybayin/helpers/load-image.dart';

import 'package:four_pics_baybayin/state/ui-state.dart' show uiState;

import 'package:four_pics_baybayin/screens/splash.dart' 
  show SplashScreen;
import 'package:four_pics_baybayin/screens/_char-symbol-previewer.dart' 
  show CharSymbolPreviewerScreen;

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
  Widget currentScreen = const SettingsScreen();

  void setScreen(Widget screen) {
    setState(() {
      currentScreen = screen;
    });
  }
  
  @override 
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => uiState)
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "Lexend"
        ),  
        home: currentScreen
      )
    );
  }
}