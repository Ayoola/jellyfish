import 'package:flutter/material.dart';
import 'package:jellyfish/components/background_image.dart';
import 'package:jellyfish/components/home_screen_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      image: AssetImage('assets/graphics/roots.gif'),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 100),
                HomeScreenButton(label: 'Focus'),
                SizedBox(height: 10),
                HomeScreenButton(label: 'Sleep'),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
