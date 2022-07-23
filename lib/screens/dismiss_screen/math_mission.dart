import 'dart:math';

import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  Alarm alarm;
  bool isPreview;

  Calculator({Key? key, required this.alarm, this.isPreview = true})
      : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // final _missionLevel = 5;
  var _expression;
  var current = 0;
  var userInput = '?';

  int random(min, max) {
    return min + Random().nextInt(max - min);
  }

  @override
  void initState() {
    
    super.initState();
  }

  Future<String> getMathExpressions(missionLevel) {
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
    return WillPopScope(
      // disable back button
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            Text(
              '$current/${widget.alarm.numberOfProblems}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              color: Colors.white,
              height: 200,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    _expression ??
                        getMathExpressions(widget.alarm.missionDifficulty),
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                width: 250,
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    // Delete Button
                    if (buttons[index] == 'DEL') {
                      return IconButton(
                        icon: const Icon(
                          Icons.backspace,
                          color: Colors.white,
                        ),
                        color: Colors.red,
                        buttontapped: () {
                          if (userInput.isNotEmpty && userInput != '?') {
                            if (userInput.length > 1) {
                              setState(() {
                                userInput = userInput.substring(
                                    0, userInput.length - 1);
                              });
                            } else {
                              setState(() {
                                userInput = '?';
                              });
                            }
                          }
                        },
                        // buttonText: buttons[index],
                      );
                    }

                    // evalute button
                    else if (buttons[index] == 'V') {
                      return IconButton(
                        icon: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        color: Colors.green,
                        buttontapped: () {
                          if (userInput != '?') {
                            if (equalPressed()) {
                              setState(() {
                                current++;
                              });
                              if (current == widget.alarm.numberOfProblems) {
                                Navigator.of(context).pop();
                              }
                              getMathExpressions(
                                  widget.alarm.missionDifficulty);
                              userInput = '?';
                            }
                          }
                          debugPrint('This is calculate function');
                        },
                      );
                    }

                    //  number buttons
                    else {
                      return NumberButton(
                        buttontapped: () {
                          // Max length of result is 7 (9999*100+9999)
                          if (userInput != '?') {
                            if (userInput.length < 8) {
                              setState(() {
                                userInput += buttons[index];
                              });
                            } else {
                              debugPrint('out of max length');
                            }
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
        bottomNavigationBar: widget.isPreview == true
            ? BottomButton(
                text: 'Exit Preview',
                margin: const EdgeInsetsDirectional.all(0),
                borderRadius: 0,
                color: Colors.white,
                textColor: Colors.black,
                onTap: () {
                  Navigator.of(context)
                    ..pop()
                    ..pop();
                  debugPrint('Exit Preview');
                },
              )
            : null,
      ),
    );
  }

  // function to compare the input and result of expression
  bool equalPressed() {
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
  final color;
  final textColor;
  final String buttonText;
  final VoidCallback buttontapped;

  const NumberButton(
      {this.color,
      this.textColor,
      required this.buttonText,
      required this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: buttontapped,
        child: Center(
          child: Text(
            softWrap: true,
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

class IconButton extends StatelessWidget {
  final color;
  final VoidCallback buttontapped;
  final Icon icon;

  const IconButton(
      {this.color, required this.buttontapped, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: buttontapped,
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
