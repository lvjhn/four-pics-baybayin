import 'package:audioplayers/audioplayers.dart';

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
  if(enabledSounds[sound]!) {
    AudioPlayer player = AudioPlayer();
    var alarmAudioPath = "sound-effects/$sound.mp3";
    player.play(AssetSource(alarmAudioPath), mode: PlayerMode.lowLatency);
  }
}