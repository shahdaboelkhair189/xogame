import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  String text;
  Function onButtonClick;
  int index;

  BoardButton(
      {required this.text, required this.onButtonClick, required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.all(4),
      child: ElevatedButton(
        onPressed: () {
          onButtonClick(index);
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));
  }
}
