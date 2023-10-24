import 'package:flutter/material.dart';

class UIState extends ChangeNotifier
{
  Color charSymbolBackgroundColor = Colors.white;
  Color charSymbolLabelColor = Colors.black;
  
  List<String> backgroundPatterns = [
    "assets/background-patterns/5-dots.webp",
    "assets/background-patterns/random_grey_variations.png",
    "assets/background-patterns/denim.webp",
    "assets/background-patterns/double-bubble-dark.webp",
    "assets/background-patterns/hotel-wallpaper-black.webp",
    "assets/background-patterns/mosaic.webp",
    "assets/background-patterns/beanstalk-dark.webp",
    "assets/background-patterns/papyrus-dark.webp",
    "assets/background-patterns/prism.png",
    "assets/background-patterns/webb-dark.png",
  ];

  /** ===== SETTINGS ===== */
  Map<String, bool> flags = {
    "enableSoundEffects" : true, 
    "showCharacterLabels" : true, 
  }; 

  int backgroundPattern = 0;
  int tileFont = 0;
  /** ===================== */

  void enableFlag(String flag) {
    flags[flag] = true;
    notifyListeners();
  }

  void disableFlag(String flag) {
    flags[flag] = false;
    notifyListeners();
  }
  
  void toggleFlag(String flag) {
    if(flags[flag]! == false) {
      enableFlag(flag);
    } else {
      disableFlag(flag);
    }
  }

  void setBackgroundPattern(int i) {
    backgroundPattern = i;
    notifyListeners();
  }

  void setTileFont(int i) {
    tileFont = i;
    notifyListeners();
  }
}
 
var uiState = UIState();