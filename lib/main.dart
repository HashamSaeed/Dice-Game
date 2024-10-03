import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.redAccent, // Start color
                Colors.deepOrange, // End color
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                AppBar(
                  title: Center(child: Text('Dice Game')),
                  backgroundColor: Colors.transparent, // Make AppBar transparent
                  foregroundColor: Colors.white,
                ),
                Expanded(child: DicePage()),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1; // Random number between 1 and 6
      rightDiceNumber = Random().nextInt(6) + 1; // Random number between 1 and 6
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset('assets/images/dice$leftDiceNumber.png'),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset('assets/images/dice$rightDiceNumber.png'),
              ),
            ),
          ],
        ),
        SizedBox(height: 100), // Add some space between the dice and the button
        SizedBox(
          width: 200, // Set your desired width
          height: 60, // Set your desired height
          child: ElevatedButton(
            onPressed: () {
              changeDiceFace(); // Change dice faces when button is pressed
            },
            child: Text('Roll Dice'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Button color
              foregroundColor: Colors.red, // Text color
            ),
          ),
        ),
      ],
    );
  }
}
