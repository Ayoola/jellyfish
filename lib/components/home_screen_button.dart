import 'package:flutter/material.dart';
import 'package:jellyfish/constants.dart';

class HomeScreenButton extends StatelessWidget {
  final String label;

  HomeScreenButton({this.label});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.pushNamed(context, '/player');
      },
      child: Text(label, style: kHomeScreenTextStyle),
    );
  }
}
