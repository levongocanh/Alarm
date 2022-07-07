// ignore_for_file: prefer_const_constructors
import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:alarm_app/widgets/mission_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepMission extends StatefulWidget {
  Alarm alarm;
  StepMission({Key? key, required this.alarm}) : super(key: key);

  @override
  State<StepMission> createState() => _StepMissionState();
}

class _StepMissionState extends State<StepMission> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    Alarm alarm = widget.alarm;
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
                'Number of Steps',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            Container(
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 80,
                    child: CupertinoPicker(
                      itemExtent: 50,
                      looping: false,
                      squeeze: 1, // display 3 items at time
                      magnification: 1, // does not zoom the selected item
                      diameterRatio: 10, // set high value for flat wheel scroll
                      selectionOverlay: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Colors.grey.shade400, width: 2),
                              bottom: BorderSide(
                                  color: Colors.grey.shade400, width: 2)),
                        ),
                      ),
                      onSelectedItemChanged: (int index) {
                        _selected = index;
                        debugPrint(_selected.toString());
                      },
                      children: List<Widget>.generate(
                        8,
                        (int index) {
                          index = index * 10 + 20;
                          return Center(
                            child: Text(
                              '$index',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 35),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'step',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        text: 'Save',
        onTap: () {
          alarm.alarmMissionType = 'step';
          alarm.missionDiffcutly = null;
          alarm.numberOfProblems = _selected * 10 + 20;
          alarm.barcodeQRcodeId = null;
          alarm.photoId = null;

          Navigator.of(context)
            ..pop()
            ..pop();
          debugPrint('Selected Step Mission');
        },
      ),
    );
  }
}
