// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:alarm_app/widgets/mission_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MathMission extends StatefulWidget {
  const MathMission({Key? key}) : super(key: key);

  @override
  State<MathMission> createState() => _MathMissionState();
}

class _MathMissionState extends State<MathMission> {
  double _missionLevel = 0;
  int _selected = 0;

  String getExampleOfExpression(missionLevel) {
    switch (missionLevel) {
      case 1:
        return '23+17=?';
      case 2:
        return '43+24+34=?';
      case 3:
        return '(72x6)+32=?';
      case 4:
        return '(37x11)+321=?';
      case 5:
        return '(162x87+1878)=?';
      default:
        return '3+8=?';
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
              missionDescription:
                  'Select the difficulty of the math problems you will solve to dismiss your alarm.',
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
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(children: [
                Text(
                  getExampleOfExpression(_missionLevel),
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Slider(
                    value: _missionLevel,
                    max: 5,
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
            Padding(
              padding: EdgeInsets.only(bottom: 10, left: 5, top: 20),
              child: Text(
                "Number of Problems",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 150,
              width: 80,
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
                        99,
                        (int index) {
                          index = index + 1;
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
                      'problems',
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
          Navigator.of(context).pop();
          debugPrint('Selected Math Mission');
        },
      ),
    );
  }
}
