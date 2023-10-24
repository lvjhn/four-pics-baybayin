import 'package:audioplayers/audioplayers.dart';
import 'package:four_pics_baybayin/state/ui-state.dart';

var enabledSounds = {
  "click-1" : true, 
  "click-2" : true, 
  "coin-spill" : false, 
  "error" : true, 
  "next-level" : true, 
  "solved" : true, 
  "swipe" : true
};

void playSound(String sound) {
  if(uiState.flags["enableSoundEffects"] == false) {
    return;
  }

  if(enabledSounds[sound]!) {
    AudioPlayer player = AudioPlayer();
    var alarmAudioPath = "sound-effects/$sound.mp3";
    player.play(AssetSource(alarmAudioPath), mode: PlayerMode.lowLatency);
  }
}