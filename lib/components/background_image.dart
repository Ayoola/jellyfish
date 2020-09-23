import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final Widget child;
  final ImageProvider image;

  BackgroundImage({@required this.image, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
