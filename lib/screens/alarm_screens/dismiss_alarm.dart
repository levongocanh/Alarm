// ignore_for_file: prefer_const_constructors

import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:flutter/widgets.dart';

class DismissAlarm extends StatelessWidget {
  final String label;
  final String time;
  final double labelSize;
  final double timeSize;

  DismissAlarm({
    required this.label,
    required this.time,
    this.labelSize = 30,
    this.timeSize = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  label,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: labelSize, fontWeight: FontWeight.bold),
                ),
                Text(
                  time,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: timeSize, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          BottomButton(
            text: 'Dismiss',
            onTap: () {
              Navigator.of(context).pop(); // to mission here
              debugPrint('DismissAlarm');
            },
          ),
        ],
      ),
    );
  }
}
