import 'package:flutter/material.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';
import 'package:jellyfish/components/soundscape_asset.dart';
import 'package:jellyfish/soundscape_assets.dart';
import 'package:jellyfish/sound_player.dart';
import 'package:jellyfish/components/background_image.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PlayScreen extends StatefulWidget {
  final List<SoundscapeAsset> soundscapeAssets = focusSoundscapeAssets;

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  SoundPlayer player = new SoundPlayer();
  bool isPlaying = false;

  Future<void> playSound(String soundPath) async {
    await player.play(soundPath);
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

  Future<void> toggleSound(String soundPath) async {
    isPlaying ? await pauseSound() : await playSound(soundPath);
  }

  @override
  void dispose() {
    stopSound();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: TikTokStyleFullPageScroller(
        contentSize: widget.soundscapeAssets.length,
        swipeThreshold: 0.2, // fraction of the screen needed to scroll
        swipeVelocityThreshold: 2000, // velocity threshold for smaller scrolls
        animationDuration: const Duration(milliseconds: 300),
        builder: (BuildContext context, int index) {
          SoundscapeAsset currentSoundscape = widget.soundscapeAssets[index];
          return VisibilityDetector(
            key: Key(currentSoundscape.imagePath),
            onVisibilityChanged: (visibilityInfo) {
              if (visibilityInfo.visibleFraction == 1)
                playSound(currentSoundscape.soundPath);
            },
            child: BackgroundImage(
              image: AssetImage(currentSoundscape.imagePath),
              child: FlatButton(
                onPressed: () => toggleSound(currentSoundscape.soundPath),
                child: SafeArea(
                  child: Container(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
