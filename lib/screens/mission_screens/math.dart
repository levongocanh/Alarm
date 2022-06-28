// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:alarm_app/widgets/mission_information.dart';
import 'package:flutter/material.dart';

class MathMission extends StatefulWidget {
  const MathMission({Key? key}) : super(key: key);

  @override
  State<MathMission> createState() => _MathMissionState();
}

class _MathMissionState extends State<MathMission> {
  double _missionLevel = 0;
  late String example;

  String getExampleMathMission(missionLevel) {
    switch(missionLevel){
      case 1:
        return 'case1';
      case 2:
        return 'case2';
      case 3:
        return 'case3';
      default:
        return 'default';
    }
  }

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
          'Giải toán',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        margin: EdgeInsetsDirectional.only(start: 15, end: 15, top: 15),
        child: ListView(
          children: <Widget>[
            MissionInformation(
              missionName: 'Giải toán',
              missionNameSize: 35,
              missionDescription: 'Select the difficulty of the math problems you will solve to dismiss your alarm.',
              missionDescriptionSize: 20,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10, left: 5, top: 20),
              child: Text(
                'Difficulty',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 145,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(children: [
                Text(
                  'data',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Slider(
                    value: _missionLevel,
                    max: 10,
                    onChanged: (double value) {
                      setState(() {
                        _missionLevel = value.ceilToDouble();
                        debugPrint(_missionLevel.toString());
                      });
                    },
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          'Easy',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text('Hard',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10, left: 5, top: 20),
              child: Text(
                'Number of problems',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 145,
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
          debugPrint('Selected Math Mission');
        },
      ),
    );
  }
}
