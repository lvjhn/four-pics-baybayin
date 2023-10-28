
import 'package:four_pics_baybayin/state/game-state.dart';
import 'package:four_pics_baybayin/state/progress-state.dart';
import 'package:four_pics_baybayin/state/ui-state.dart';

void resetGameData(bool notify) {
  gameState.reset(notify); 
  progressState.reset(notify);
}