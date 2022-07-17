import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:alarm_app/widgets/mission_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShakeMission extends StatefulWidget {
  Alarm alarm;
  ShakeMission({Key? key, required this.alarm}) : super(key: key);

  @override
  State<ShakeMission> createState() => _ShakeMissionState();
}

class _ShakeMissionState extends State<ShakeMission> {
  late int _selected;
  late double _missionLevel;
  late Alarm alarm;
  @override
  void initState() {
    alarm = widget.alarm;
    _selected = (alarm.alarmType == 'shake' ? alarm.numberOfProblems : 0)!;
    _missionLevel =
        (alarm.alarmType == 'shake' ? alarm.missionDifficulty : 0)!.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          'Shake Phone',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        margin: const EdgeInsetsDirectional.only(start: 15, end: 15, top: 15),
        child: ListView(
          children: <Widget>[
            MissionInformation(
              missionName: 'Shake',
              missionNameSize: 35,
              missionDescription:
                  'Select how many times you will shake your phone to dismiss your alarm.',
              missionDescriptionSize: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 5, top: 20),
              child: Text(
                'Number of shakes',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            Container(
              height: 150,
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
                        200,
                        (int index) {
                          index = index * 5 + 5;
                          return Center(
                            child: Text(
                              '$index',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 35),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'shakes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 5, top: 20),
              child: Text(
                'Shake Sensitivity',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Slider(
                    value: _missionLevel,
                    max: 2,
                    onChanged: (double value) {
                      if (value.ceilToDouble() != _missionLevel) {
                        setState(() {
                          _missionLevel = value.ceilToDouble();
                          debugPrint(_missionLevel.toString());
                        });
                      }
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: const [
                        Text(
                          'Easy',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Hard',
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
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        text: 'Save',
        onTap: () {
          alarm.alarmMissionType = 'shake';
          alarm.missionDifficulty = _missionLevel.toInt();
          alarm.numberOfProblems = _selected * 5 + 5;
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
