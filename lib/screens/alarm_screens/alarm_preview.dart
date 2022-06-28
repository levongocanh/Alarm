// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:alarm_app/screens/alarm_screens/dismiss_alarm.dart';
import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:flutter/material.dart';

class PreviewAlarm extends StatefulWidget {
  const PreviewAlarm({Key? key}) : super(key: key);

  @override
  State<PreviewAlarm> createState() => _PreviewAlarmState();
}

class _PreviewAlarmState extends State<PreviewAlarm> {
  double _missionLevel = 0;
  late String example;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DismissAlarm(
        label: 'label',
        time: 'HH:MM',
      ),
      bottomNavigationBar: BottomButton(
        text: 'Exit Preview',
        margin: const EdgeInsetsDirectional.all(0),
        borderRadius: 0,
        color: Colors.grey,
        onTap: () {
          Navigator.of(context).pop();
          debugPrint('Exit Preview');
        },
      ),
    );
  }
}

