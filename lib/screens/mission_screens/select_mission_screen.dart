// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:alarm_app/screens/mission_screens/math.dart';
import 'package:alarm_app/screens/mission_screens/qr_scan.dart';
import 'package:alarm_app/screens/mission_screens/step.dart';
import 'package:alarm_app/screens/mission_screens/take_photo.dart';
import 'package:alarm_app/screens/mission_screens/typing.dart';
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
                Container(
                  height: 70,
                  margin: EdgeInsetsDirectional.only(top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.of(context).pop()
                    },
                    child: Row(children: <Widget>[
                      SizedBox(
                        width: 50,
                        child: Icon(
                            Icons.alarm,
                          ),
                        ),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            'Mặc định',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 50, child: Icon(Icons.chevron_right)),
                    ]),
                  ),
                ),
                Container(
                  height: 70,
                  margin: EdgeInsetsDirectional.only(top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TakePhotoMission()))
                    },
                    child: Row(children: <Widget>[
                      SizedBox(
                        width: 50,
                        child: Icon(
                            Icons.photo_camera,
                          ),
                        ),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            'Chụp ảnh',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 50, child: Icon(Icons.chevron_right)),
                    ]),
                  ),
                ),
                Container(
                  height: 70,
                  margin: EdgeInsetsDirectional.only(top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MathMission()))
                    },
                    child: Row(children: <Widget>[
                      SizedBox(
                        width: 50,
                        child: Icon(
                            Icons.calculate,
                          ),
                        ),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            'Giải toán',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 50, child: Icon(Icons.chevron_right)),
                    ]),
                  ),
                ),
                Container(
                  height: 70,
                  margin: EdgeInsetsDirectional.only(top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ScanQRMission()))
                    },
                    child: Row(children: <Widget>[
                      SizedBox(
                        width: 50,
                        child: Icon(
                            Icons.qr_code_scanner,
                          ),
                        ),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            'Mã vạch/mã QR',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 50, child: Icon(Icons.chevron_right)),
                    ]),
                  ),
                ),
                Container(
                  height: 70,
                  margin: EdgeInsetsDirectional.only(top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TypingMission()))
                    },
                    child: Row(children: <Widget>[
                      SizedBox(
                        width: 50,
                        child: Icon(
                            Icons.keyboard,
                          ),
                        ),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            'Typing',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 50, child: Icon(Icons.chevron_right)),
                    ]),
                  ),
                ),
                Container(
                  height: 70,
                  margin: EdgeInsetsDirectional.only(top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StepMission()))
                    },
                    child: Row(children: <Widget>[
                      SizedBox(
                        width: 50,
                        child: Icon(
                            Icons.directions_run,
                          ),
                        ),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            'Step',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(width: 50, child: Icon(Icons.chevron_right)),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
