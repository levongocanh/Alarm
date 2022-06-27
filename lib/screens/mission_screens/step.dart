// ignore_for_file: prefer_const_constructors

import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:alarm_app/widgets/mission_information.dart';
import 'package:flutter/material.dart';

class StepMission extends StatefulWidget {
  const StepMission({Key? key}) : super(key: key);

  @override
  State<StepMission> createState() => _StepMissionState();
}

class _StepMissionState extends State<StepMission> {
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
            'Step',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
        margin: EdgeInsetsDirectional.only(start: 15, end: 15, top: 15),
        child: ListView(
          children: <Widget>[
            MissionInformation(
              missionName: 'Step',
              missionNameSize: 35,
              missionDescription:
                  'Select how many steps that you will take to dismiss your alarm.',
              missionDescriptionSize: 20,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10, left: 5, top: 20),
              child: Text(
                'Number of steps',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 140,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('List Wheel Scroll làm sau'),
            )
          ],
        ),
      ),
        bottomNavigationBar: BottomButton(
        text: 'Save',
        onTap: () {
            Navigator.of(context).pop();
            debugPrint('Selected Step Mission');
          },
        ), 
      );
  }
}