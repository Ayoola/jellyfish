import 'package:flutter/material.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';
import 'package:jellyfish/components/soundscape.dart';
import 'package:jellyfish/soundscape_list.dart';

class PlayScreen extends StatelessWidget {
  final List<Soundscape> soundscapes = focusSoundscapes;

  //PlayScreen({this.soundscapes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TikTokStyleFullPageScroller(
        contentSize: soundscapes.length,
        swipeThreshold: 0.2, // fraction of the screen needed to scroll
        swipeVelocityThreshold: 2000, // velocity threshold for smaller scrolls
        animationDuration: const Duration(milliseconds: 300),
        builder: (BuildContext context, int index) {
          return soundscapes[index];
        },
      ),
    );
  }
}
