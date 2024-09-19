import 'package:flutter/material.dart';
import 'package:xogame/player_screen.dart';
import 'package:xogame/xo_game.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PlayerScreen.routeName,
      routes: {
        XOGame.routeName: (context) => XOGame(),
        PlayerScreen.routeName: (context) => PlayerScreen()
      },
    );
  }
}

void main() {
  runApp(MyApp());
}
