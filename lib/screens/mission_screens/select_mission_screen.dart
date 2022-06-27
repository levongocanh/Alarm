// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:alarm_app/screens/mission_screens/math.dart';
import 'package:alarm_app/screens/mission_screens/qr_scan.dart';
import 'package:alarm_app/screens/mission_screens/step.dart';
import 'package:alarm_app/screens/mission_screens/take_photo.dart';
import 'package:alarm_app/screens/mission_screens/typing.dart';
import 'package:alarm_app/widgets/select_mission_button.dart';
import 'package:flutter/material.dart';

class SelectMission extends StatefulWidget {
  const SelectMission({Key? key}) : super(key: key);

  @override
  State<SelectMission> createState() => _SelectMissionState();
}

class _SelectMissionState extends State<SelectMission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.navigate_before, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(
            'Select Mission',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          margin: EdgeInsetsDirectional.only(start: 15, end: 15, top: 15),
          child: Center(
            child: ListView(
              children: <Widget>[
                SelectMissionButton(
                  missionName: 'Mặc định',
                  missionIcon: Icon(Icons.alarm),
                  onTap: () => {
                    Navigator.of(context).pop(),
                    debugPrint('Selected Default')
                  },
                  color: Colors.grey[300],
                ),

                SelectMissionButton(
                  missionName: 'Chụp ảnh',
                  missionIcon: Icon(Icons.photo_camera),
                  onTap: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TakePhotoMission()))
                  },
                  color: Colors.grey[300],
                ),

                SelectMissionButton(
                  missionName: 'Giải toán',
                  missionIcon: Icon(Icons.calculate),
                  onTap: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MathMission()))
                  },
                  color: Colors.grey[300],
                ),

                SelectMissionButton(
                  missionName: 'Mã vạch/mã QR',
                  missionIcon: Icon(Icons.qr_code_scanner),
                  onTap: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ScanQRMission()))
                  },
                  color: Colors.grey[300],
                ),

                SelectMissionButton(
                  missionName: 'Typing',
                  missionIcon: Icon(Icons.keyboard),
                  onTap: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TypingMission()))
                  },
                  color: Colors.grey[300],
                ),
                
                SelectMissionButton(
                  missionName: 'Step',
                  missionIcon: Icon(Icons.directions_run),
                  onTap: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StepMission()))
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