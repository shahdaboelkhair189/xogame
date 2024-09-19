import 'package:flutter/material.dart';
import 'board button.dart';

class XOGame extends StatefulWidget {
  static String routeName = 'xo_game';

  @override
  State<XOGame> createState() => _XOGameState();
}

class _XOGameState extends State<XOGame> {
  List<String> boardState = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    XoGameArgs args = ModalRoute.of(context)?.settings.arguments as XoGameArgs;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "XO Game",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(100, 60, 80, 60),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${args.player1XoName} (X)',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$player1Score',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${args.player2XoName} (O)',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$player2Score',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardButton(
                    text: boardState[0],
                    index: 0,
                    onButtonClick: onButtonClicked,
                  ),
                  BoardButton(
                    text: boardState[1],
                    index: 1,
                    onButtonClick: onButtonClicked,
                  ),
                  BoardButton(
                    text: boardState[2],
                    index: 2,
                    onButtonClick: onButtonClicked,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardButton(
                    text: boardState[3],
                    index: 3,
                    onButtonClick: onButtonClicked,
                  ),
                  BoardButton(
                    text: boardState[4],
                    index: 4,
                    onButtonClick: onButtonClicked,
                  ),
                  BoardButton(
                    text: boardState[5],
                    index: 5,
                    onButtonClick: onButtonClicked,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BoardButton(
                    text: boardState[6],
                    index: 6,
                    onButtonClick: onButtonClicked,
                  ),
                  BoardButton(
                    text: boardState[7],
                    index: 7,
                    onButtonClick: onButtonClicked,
                  ),
                  BoardButton(
                    text: boardState[8],
                    index: 8,
                    onButtonClick: onButtonClicked,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  int counter = 0;

  void onButtonClicked(int index) {
    if (boardState[index].isEmpty) {
      if (counter % 2 == 0) {
        boardState[index] = 'X';
      } else {
        boardState[index] = 'O';
      }
      counter++;
      if (checkWinner('X')) {
        player1Score += 5;
        initBoard();
      } else if (checkWinner('O')) {
        player2Score += 5;
        initBoard();
      } else if (counter == 9) {
        initBoard();
      }
      setState(() {});
    }
  }

  ///rows
  bool checkWinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }

    ///cols
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }

    ///diagonal
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }
    return false;
  }

  void initBoard() {
    boardState = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    counter = 0;
    setState(() {});
  }
}

class XoGameArgs {
  String player1XoName;
  String player2XoName;

  XoGameArgs({required this.player1XoName, required this.player2XoName});
}
