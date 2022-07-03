import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _Calculator();
}

class _Calculator extends State<Calculator> {
  final _missionLevel = 5;
  var userInput = '?';
  var _expression;

  int random(min, max) {
    return min + Random().nextInt(max - min);
  }

  String getMathExpressions(missionLevel) {
    switch (missionLevel) {
      case 1:
        setState(() {
          _expression = '${random(10, 99)}+${random(10, 99)}';
        });
        return _expression;
      case 2:
        setState(() {
          _expression = '${random(10, 99)}+${random(10, 99)}+${random(10, 99)}';
        });
        return _expression;
      case 3:
        setState(() {
          _expression = '(${random(10, 99)}x${random(1, 9)})+${random(10, 99)}';
        });
        return _expression;
      case 4:
        setState(() {
          _expression =
              '(${random(10, 99)}x${random(10, 99)})+${random(100, 999)}';
        });
        return _expression;
      case 5:
        setState(() {
          _expression =
              '(${random(100, 999)}x${random(10, 99)})+${random(1000, 9999)}';
        });
        return _expression;
      default:
        setState(() {
          _expression = '${random(1, 9)}+${random(1, 9)}';
        });
    }
    ;
    return _expression;
  }

  // Array of button
  final List<String> buttons = [
    '7',
    '8',
    '9',
    '4',
    '5',
    '6',
    '1',
    '2',
    '3',
    'DEL',
    '0',
    'V',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 300,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _expression ?? getMathExpressions(_missionLevel),
                  style: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 200,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '=',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            userInput,
                            style: TextStyle(
                                fontSize: 30,
                                color: userInput == '?'
                                    ? Colors.grey
                                    : Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              width: 240,
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  // Delete Button
                  if (buttons[index] == 'DEL') {
                    return NumberButton(
                      buttontapped: () {
                        if (userInput.isNotEmpty && userInput != '?') {
                          if (userInput.length > 1) {
                            setState(() {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            });
                          } else {
                            setState(() {
                              userInput = '?';
                            });
                          }
                        }
                      },
                      buttonText: buttons[index],
                      color: Colors.red,
                      textColor: Colors.white,
                    );
                  }

                  // evalute button
                  else if (buttons[index] == 'V') {
                    return NumberButton(
                      buttontapped: () {
                        if (userInput != '?') {
                          if (equalPressed()) {
                            getMathExpressions(_missionLevel);
                            userInput = '?';
                          }
                        }
                        debugPrint('This is calculate function');
                      },
                      buttonText: buttons[index],
                      color: Colors.green,
                      textColor: Colors.white,
                    );
                  }
                  //  number buttons
                  else {
                    return NumberButton(
                      buttontapped: () {
                        if (userInput != '?') {
                          setState(() {
                            userInput += buttons[index];
                          });
                        } else {
                          setState(() {
                            userInput = buttons[index];
                          });
                        }
                      },
                      buttonText: buttons[index],
                      color: Colors.blueGrey.shade800,
                      textColor: Colors.white,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

// function to calculate the input operation
  bool equalPressed() {
    // String finaluserinput = userInput;
    Expression exp = Parser().parse(_expression.replaceAll('x', '*'));
    // debugPrint(_expression);
    double eval = exp.evaluate(EvaluationType.REAL, ContextModel());
    if (eval.toInt().toString() == userInput) {
      return true;
    }
    return false;
  }
}

class NumberButton extends StatelessWidget {
  // declaring variables
  final color;
  final textColor;
  final String buttonText;
  final VoidCallback buttontapped;
  final Widget? child;

  //Constructor
  const NumberButton(
      {this.color,
      this.textColor,
      required this.buttonText,
      required this.buttontapped,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: buttontapped,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
