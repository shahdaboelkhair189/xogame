import 'package:flutter/material.dart';
import 'package:xogame/xo_game.dart';

class PlayerScreen extends StatelessWidget {
  static const String routeName = 'player_screen';
  String player1Name = '';
  String player2Name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Player Screen",
          style:
              TextStyle(color: Color.fromARGB(200, 100, 70, 50), fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(200, 200, 100, 200),
      ),
      body: Column(children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Player1 Name',
          ),
          onChanged: (text) {
            player1Name = text;
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Player2 Name'),
          onChanged: (text) {
            player2Name = text;
          },
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(XOGame.routeName,
                  arguments: XoGameArgs(
                    player1XoName: player1Name,
                    player2XoName: player2Name,
                  ));
            },
            child: Text("Let's Play"))
      ]),
    );
  }
}
