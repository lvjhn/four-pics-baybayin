import 'package:audioplayers/audioplayers.dart';

void playSound(String sound) {
  AudioPlayer player = AudioPlayer();
  var alarmAudioPath = "sound-effects/$sound.mp3";
  player.play(AssetSource(alarmAudioPath), mode: PlayerMode.lowLatency);
}