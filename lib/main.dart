import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  rollLeftDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  rollRightDice() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  void rollAllDice() {
    rollLeftDice();
    rollRightDice();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text('Roll & Play',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontFamily: 'Raleway',
              )),
        ),
        Row(children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                rollLeftDice();
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                rollRightDice();
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            child: FloatingActionButton.extended(
              onPressed: () {
                rollAllDice();
              },
              backgroundColor: Colors.white,
              foregroundColor: Colors.red,
              label: Text('Roll Dice'),
            ),
          ),
        )
      ],
    );
  }
}
