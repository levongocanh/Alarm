// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/models/database.dart';
import 'package:alarm_app/models/ringtone.dart';
import 'package:alarm_app/screens/dismiss_screen/math_mission.dart';
import 'package:alarm_app/screens/dismiss_screen/scanning_mission.dart';
import 'package:alarm_app/screens/dismiss_screen/shake_phone.dart';
import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import 'package:vibration/vibration.dart';

class DismissAlarm extends StatefulWidget {
  final Alarm alarm;
  final double labelSize;
  final double timeSize;
  final bool isPreview;

  DismissAlarm({
    required this.alarm,
    this.labelSize = 30,
    this.timeSize = 80,
    this.isPreview = true,
  });

  @override
  State<DismissAlarm> createState() => _DismissAlarmState();
}

class _DismissAlarmState extends State<DismissAlarm> {
  bool finish = false;
  late DatabaseManagement database;

  final audioPlayer = AudioPlayer();
  AudioCache cachePlayer =
      AudioCache(fixedPlayer: AudioPlayer(mode: PlayerMode.MEDIA_PLAYER));
  List<Ringtone> ringtones = [];

  @override
  void initState() {
    database = DatabaseManagement();
    getRingtones();
    if (widget.alarm.alarmVibrate == 1) {
      vibrate();
    }
    super.initState();
  }

  @override
  void dispose() {
    Vibration.cancel();
    super.dispose();
  }

  void getRingtones() async {
    ringtones = await database.getRingtones();
    setState(() {});
  }

  Future<void> vibrate() async {
    if (await Vibration.hasVibrator()) {
      while (!finish) {
        Vibration.vibrate(duration: 1000, amplitude: 255);
        await Future.delayed(const Duration(milliseconds: 1500));
      }
    }
  }

  String findRingtonePath(int id) =>
      (ringtones.firstWhere((i) => i.ringtoneId == id)).ringtonePath;

  String getCurrentDisplayTime() {
    return DateFormat.Hm().format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(ringtones.toString());
    // if (ringtones.isNotEmpty) {
    //   cachePlayer.play(findRingtonePath(widget.alarm.alarmRingtoneId));
    // }

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return WillPopScope(
      // disable back e
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      widget.alarm.alarmLabel,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: widget.labelSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      getCurrentDisplayTime(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: widget.timeSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              BottomButton(
                text: 'Loại bỏ',
                onTap: () async {
                  finish = true;
                  Vibration.cancel();
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
                    case 'shake':
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ShakePhoneMission(alarm: widget.alarm)));
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
        ),
        bottomNavigationBar: widget.isPreview == true
            ? BottomButton(
                text: 'Exit Preview',
                margin: const EdgeInsetsDirectional.all(0),
                borderRadius: 0,
                color: Colors.white,
                textColor: Colors.black,
                onTap: () {
                  finish = true;
                  Vibration.cancel();
                  Navigator.of(context).pop();
                  debugPrint('Exit Preview');
                },
              )
            : null,
      ),
    );
  }
}
