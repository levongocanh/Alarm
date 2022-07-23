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
import 'package:intl/intl.dart';
import 'dart:async';

import 'package:vibration/vibration.dart';

class DismissAlarm extends StatefulWidget {
  final Alarm alarm;
  final double labelSize;
  final double timeSize;
  final bool isPreview;

  const DismissAlarm({
    Key? key,
    required this.alarm,
    this.labelSize = 30,
    this.timeSize = 80,
    this.isPreview = true,
  }) : super(key: key);

  @override
  State<DismissAlarm> createState() => _DismissAlarmState();
}

class _DismissAlarmState extends State<DismissAlarm> {
  bool finish = false;
  late Alarm alarm;
  late DatabaseManagement database;
  List<Ringtone> ringtones = [];
  final audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    database = DatabaseManagement();
    getRingtones().then((value) => playAudio());
    if (widget.alarm.alarmVibrate == 1) {
      vibrate();
    }
  }

  @override
  void dispose() {
    Vibration.cancel();
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> playAudio() async {
    await audioPlayer.pause();
    // loop the ringtone when it completed
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    var path = findRingtonePath(widget.alarm.alarmRingtoneId);
    debugPrint(path.toString());
    var file = await AudioCache().load(path);

    await audioPlayer.play(
      file.path,
      isLocal: true,
      volume: widget.alarm.alarmVolume.toDouble(),
    );
  }

  Future<void> getRingtones() async {
    ringtones = await database.getRingtones();
  }

  String findRingtonePath(int id) =>
      (ringtones.firstWhere((i) => i.ringtoneId == id)).ringtonePath;

  Future<void> vibrate() async {
    if (await Vibration.hasVibrator()) {
      while (!finish) {
        Vibration.vibrate(duration: 1000, amplitude: 255);
        await Future.delayed(const Duration(milliseconds: 1500));
      }
    }
  }

  String getCurrentDisplayTime() {
    return DateFormat.Hm().format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    // uncomment bellow code for full screen mode
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return WillPopScope(
      // disable back button
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
                  audioPlayer.dispose();
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
