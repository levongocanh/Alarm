import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/screens/mission_screens/math.dart';
import 'package:alarm_app/screens/mission_screens/scan_qr/qr_scan.dart';
import 'package:alarm_app/screens/mission_screens/shake_phone.dart';
import 'package:alarm_app/screens/mission_screens/step.dart';
import 'package:alarm_app/screens/mission_screens/take_photo/take_photo.dart';
import 'package:alarm_app/screens/mission_screens/typing.dart';
import 'package:alarm_app/widgets/select_mission_button.dart';
import 'package:flutter/material.dart';

class SelectMission extends StatefulWidget {
  Alarm alarm;
  SelectMission({Key? key, required this.alarm}) : super(key: key);

  @override
  State<SelectMission> createState() => _SelectMissionState();
}

class _SelectMissionState extends State<SelectMission> {
  @override
  Widget build(BuildContext context) {
    Alarm alarm = widget.alarm;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Select Mission',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        margin: const EdgeInsetsDirectional.only(start: 15, end: 15, top: 15),
        child: Center(
          child: ListView(
            children: <Widget>[
              SelectMissionButton(
                missionName: 'Mặc định',
                missionInformation: '',
                onSelected:
                    widget.alarm.alarmMissionType == 'default' ? true : false,
                missionIcon: const Icon(Icons.alarm),
                color: Colors.grey[300],
                onTap: () => {
                  alarm.alarmMissionType = 'default',
                  alarm.missionDifficulty = null,
                  alarm.numberOfProblems = null,
                  alarm.barcodeQRcodeId = null,
                  alarm.photoId = null,
                  Navigator.of(context).pop(alarm),
                  debugPrint('Selected Default')
                },
              ),
              SelectMissionButton(
                missionName: 'Chụp ảnh',
                missionInformation: '',
                onSelected:
                    widget.alarm.alarmMissionType == 'photo' ? true : false,
                missionIcon: const Icon(Icons.photo_camera),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TakePhotoMission(
                                alarm: alarm,
                              ))),
                },
                color: Colors.grey[300],
              ),
              SelectMissionButton(
                missionName: 'Giải toán',
                missionInformation: widget.alarm.alarmMissionType == 'math'
                    ? '${widget.alarm.numberOfProblems} problems'
                    : '',
                onSelected:
                    widget.alarm.alarmMissionType == 'math' ? true : false,
                missionIcon: const Icon(Icons.calculate),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MathMission(
                                alarm: alarm,
                              )))
                },
                color: Colors.grey[300],
              ),
              SelectMissionButton(
                missionName: 'Lắc điện thoại',
                missionInformation: widget.alarm.alarmMissionType == 'shake'
                    ? '${widget.alarm.numberOfProblems} shakes'
                    : '',
                onSelected:
                    widget.alarm.alarmMissionType == 'shake' ? true : false,
                missionIcon: const Icon(Icons.vibration),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShakeMission(
                                alarm: alarm,
                              )))
                },
                color: Colors.grey[300],
              ),
              SelectMissionButton(
                missionName: 'Mã vạch/mã QR',
                missionInformation: '',
                onSelected:
                    widget.alarm.alarmMissionType == 'scanning' ? true : false,
                missionIcon: const Icon(Icons.qr_code_scanner),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ScanQRMission(
                                alarm: alarm,
                              )))
                },
                color: Colors.grey[300],
              ),
              SelectMissionButton(
                missionName: 'Typing',
                missionInformation: widget.alarm.alarmMissionType == 'typing'
                    ? '${widget.alarm.numberOfProblems} phrases'
                    : '',
                onSelected:
                    widget.alarm.alarmMissionType == 'typing' ? true : false,
                missionIcon: const Icon(Icons.keyboard),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TypingMission(
                                alarm: alarm,
                              )))
                },
                color: Colors.grey[300],
              ),
              SelectMissionButton(
                missionName: 'Step',
                missionInformation: widget.alarm.alarmMissionType == 'step'
                    ? '${widget.alarm.numberOfProblems} steps'
                    : '',
                onSelected:
                    widget.alarm.alarmMissionType == 'step' ? true : false,
                missionIcon: const Icon(Icons.directions_run),
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StepMission(
                                alarm: alarm,
                              )))
                },
                color: Colors.grey[300],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
