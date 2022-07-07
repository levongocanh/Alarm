// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/screens/dismiss_screen/math_mission.dart';
import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DismissAlarm extends StatelessWidget {
  final Alarm alarm;
  final double labelSize;
  final double timeSize;

  DismissAlarm({
    required this.alarm,
    this.labelSize = 30,
    this.timeSize = 80,
  });

  String getCurrentDisplayTime() {
    return DateFormat.Hm().format(DateTime.now());
  }

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
                  alarm.alarmLabel,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: labelSize, fontWeight: FontWeight.bold),
                ),
                Text(
                  getCurrentDisplayTime(),
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
              switch (alarm.alarmMissionType) {
                case 'math':
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Calculator(
                                alarm: alarm,
                              )));
                  break;
                default:
              }

              debugPrint('DismissAlarm');
            },
          ),
        ],
      ),
    );
  }
}
