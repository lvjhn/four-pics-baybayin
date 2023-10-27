import 'package:flutter/material.dart';
import 'package:four_pics_baybayin/char-symbols/@base.dart';
import 'package:four_pics_baybayin/char-symbols/deko.dart';
import 'package:four_pics_baybayin/char-symbols/robotika.dart';
import 'package:four_pics_baybayin/char-symbols/sarimanok.dart';
import 'package:four_pics_baybayin/char-symbols/sejong.dart';
import 'package:four_pics_baybayin/char-symbols/sisil.dart';
import 'package:four_pics_baybayin/components/backdrop/modal-dialog.dart';
import 'package:four_pics_baybayin/helpers/globals.dart';
import 'package:four_pics_baybayin/screens/main-menu.dart';
import 'package:four_pics_baybayin/screens/splash.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UIState extends ChangeNotifier {
  Color charSymbolBackgroundColor = Colors.white;
  Color charSymbolLabelColor = Colors.black;

  Widget currentScreen = const SplashScreen();

  List<String> backgroundPatterns = [
    "assets/background-patterns/denim.webp",
    "assets/background-patterns/5-dots.webp",
    "assets/background-patterns/random_grey_variations.png",
    "assets/background-patterns/double-bubble-dark.webp",
    "assets/background-patterns/hotel-wallpaper-black.webp",
    "assets/background-patterns/mosaic.webp",
    "assets/background-patterns/beanstalk-dark.webp",
    "assets/background-patterns/papyrus-dark.webp",
    "assets/background-patterns/prism.png",
    "assets/background-patterns/webb-dark.png",
  ];

  var tilesets = [
    [SisilCharSymbolNoLabels(), SisilCharSymbolWithLabels()],
    [DekoCharSymbolNoLabels(), DekoCharSymbolWithLabels()],
    [RobotikaCharSymbolNoLabels(), RobotikaCharSymbolWithLabels()],
    [SarimanokCharSymbolNoLabels(), SarimanokCharSymbolWithLabels()],
    [SejongCharSymbolNoLabels(), SejongCharSymbolWithLabels()]
  ];

  /** ===== SETTINGS ===== */
  Map<String, bool> flags = {
    "enableSoundEffects": true,
    "showCharacterLabels": true,
  };

  int backgroundPattern = 0;
  int tileFont = 0;
  /** ===================== */

  CharSymbolBase getCurrentTileFont() {
    int hasLabelIndex = uiState.flags["showCharacterLabels"]! ? 1 : 0;
    return uiState.tilesets[uiState.tileFont][hasLabelIndex];
  }

  void enableFlag(String flag) {
    flags[flag] = true;
    saveSettings();
    notifyListeners();
  }

  void disableFlag(String flag) {
    flags[flag] = false;
    saveSettings();
    notifyListeners();
  }

  void toggleFlag(String flag) {
    if (flags[flag]! == false) {
      enableFlag(flag);
    } else {
      disableFlag(flag);
    }
  }

  void setBackgroundPattern(int i) {
    backgroundPattern = i;
    saveSettings();
    notifyListeners();
  }

  void setTileFont(int i) {
    tileFont = i;
    saveSettings();
    notifyListeners();
  }

  void saveSettings() {
    final storage = GetStorage();

    storage.write(
      'enableSoundEffects', 
      flags["enableSoundEffects"]! ? "true" : "false"
    );

    storage.write(
      'showCharacterLabels',
      flags["showCharacterLabels"]! ? "true" : "false"
    );

    storage.write('tileFont', tileFont.toString());

    storage.write('backgroundPattern', backgroundPattern.toString());
  }

  void loadSetings() {
    final storage = GetStorage();

    flags["enableSoundEffects"] =
        (storage.read("enableSoundEffects") ?? "true") == "true" ? true : false;

    flags["showCharacterLabels"] =
        (storage.read("showCharacterLabels") ?? "true") == "true"
            ? true
            : false;

    tileFont = int.parse(storage.read("tileFont") ?? "0");

    backgroundPattern = int.parse(storage.read("backgroundPattern") ?? "0");
  }

  void reset() {
    final storage = GetStorage();
    storage.remove("showCharacterLabels");
    storage.remove("enableSoundEffects"); 
    storage.remove("backgroundPattern"); 
    storage.remove("tileFont");
  }
}

var uiState = UIState();
