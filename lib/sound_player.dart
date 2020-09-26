import 'package:assets_audio_player/assets_audio_player.dart';

class SoundPlayer {
  final player = AssetsAudioPlayer();

  Future<void> play(String path) async {
    await player.open(Audio(path),
        autoStart: true, showNotification: true, loopMode: LoopMode.single);
    //await player.play();
  }

  Future<void> pause() async {
    await player.pause();
  }

  Future<void> stop() async {
    await player.stop();
  }
}
