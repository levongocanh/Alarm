// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/screens/alarm_screens/dismiss_alarm.dart';
import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PreviewAlarm extends StatefulWidget {
  final Alarm alarm;
  const PreviewAlarm({Key? key, required this.alarm}) : super(key: key);

  @override
  State<PreviewAlarm> createState() => _PreviewAlarmState();
}

class _PreviewAlarmState extends State<PreviewAlarm> {
  @override
  Widget build(BuildContext context) {
    // uncomment below code for full screen mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: DismissAlarm(
        alarm: widget.alarm,
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
