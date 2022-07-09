// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/models/database.dart';
import 'package:alarm_app/models/ringtone.dart';
import 'package:alarm_app/screens/dismiss_screen/math_mission.dart';
import 'package:alarm_app/screens/mission_screens/scan_qr/qr_scan_dismiss.dart';
import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DismissAlarm extends StatefulWidget {
  final Alarm alarm;
  final double labelSize;
  final double timeSize;

  DismissAlarm({
    required this.alarm,
    this.labelSize = 30,
    this.timeSize = 80,
  });

  @override
  State<DismissAlarm> createState() => _DismissAlarmState();
}

class _DismissAlarmState extends State<DismissAlarm> {
  late DatabaseManagement database;
  final audioPlayer = AudioPlayer();
  AudioCache cachePlayer =
      AudioCache(fixedPlayer: AudioPlayer(mode: PlayerMode.MEDIA_PLAYER));

  List<Ringtone> ringtones = [];

  @override
  void initState() {
    database = DatabaseManagement();
    getRingtones();
    super.initState();
  }

  void getRingtones() async {
    ringtones = await database.getRingtones();
    setState(() {});
  }

  String findRingtonePath(int id) =>
      (ringtones.firstWhere((i) => i.ringtoneId == id)).ringtonePath;

  String getCurrentDisplayTime() {
    return DateFormat.Hm().format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(ringtones.toString());
    // if (ringtones.isNotEmpty) debugPrint(findRingtonePath(widget.alarm.alarmRingtoneId));
    // debugPrint(getApplicationDocumentsDirectory().toString());
    if (ringtones.isNotEmpty)
      cachePlayer.play(findRingtonePath(widget.alarm.alarmRingtoneId));
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  widget.alarm.alarmLabel,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: widget.labelSize, fontWeight: FontWeight.bold),
                ),
                Text(
                  getCurrentDisplayTime(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: widget.timeSize, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          BottomButton(
            text: 'Dismiss',
            onTap: () {
              switch (widget.alarm.alarmMissionType) {
                case 'math':
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Calculator(
                                alarm: widget.alarm,
                              )));
                  break;
                case 'scanning':
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DismissQRcode(
                              idQRcode: widget.alarm.barcodeQRcodeId!)));
                  break;
                default:
                  Navigator.of(context).pop();
                  break;
              }

              debugPrint('DismissAlarm');
            },
          ),
        ],
      ),
    );
  }
}
