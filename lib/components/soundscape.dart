import 'package:flutter/material.dart';
import 'package:jellyfish/components/background_image.dart';
import 'package:jellyfish/sound_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Soundscape extends StatefulWidget {
  final String soundPath;
  final String imagePath;

  Soundscape({@required this.soundPath, @required this.imagePath});

  @override
  _SoundscapeState createState() => _SoundscapeState();
}

class _SoundscapeState extends State<Soundscape> {
  SoundPlayer player = new SoundPlayer();
  bool isPlaying = false;

  Future<void> playSound() async {
    await player.play(widget.soundPath);
    isPlaying = true;
  }

  Future<void> pauseSound() async {
    await player.pause();
    isPlaying = false;
  }

  Future<void> stopSound() async {
    await player.stop();
    isPlaying = false;
  }

  Future<void> toggleSound() async {
    isPlaying ? await stopSound() : await playSound();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    return VisibilityDetector(
      key: Key(widget.imagePath),
      onVisibilityChanged: (visibilityInfo) async {
        visibilityInfo.visibleFraction < 1.0
            ? await stopSound()
            : await playSound();
        debugPrint(
            '${visibilityInfo.key} visibility is ${visibilityInfo.visibleFraction}');
      },
      child: BackgroundImage(
        image: AssetImage(widget.imagePath),
        child: SafeArea(
          child: FlatButton(
            onPressed: () async => await toggleSound(),
            child: Container(),
          ),
        ),
      ),
    );
  }
}
