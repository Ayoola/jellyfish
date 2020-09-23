import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/play_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roots',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/player': (context) => PlayScreen(),
      },
    );
  }
}
