// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:alarm_app/screens/mission_screens/select_mission_screen.dart';
import 'package:alarm_app/screens/ringtone_screen/select_ringtone_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  double _sliderValue = 0;
  bool _vibrate = false;
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.navigate_before, color: Colors.black),
          // onPressed: () => _showMyDialog(),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          FloatingActionButton(
            onPressed: () {
              debugPrint('Open Preview Alarm');
            },
            child: Icon(Icons.visibility),
          )
        ],  
      ),
      body: Container(
        margin: EdgeInsetsDirectional.only(start: 15, end: 15, top: 15),
        child: ListView(
          children: <Widget>[
            Container(
              height: 150,
              color: Colors.red,
              child: Text('Wheel Scroll for Hour and Minute'),
            ),
            Row(
              
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 45,
                  width: 45,
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black54,
                  ),
                  child: InkWell(
                    // change state selected of day for repeat here
                    onTap: () {},
                    child: Center(
                      child: Text(
                        'CN',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black54,
                  ),
                  child: InkWell(
                    // change state selected of day for repeat here
                    onTap: () {},
                    child: Center(
                      child: Text(
                        'T2',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black54,
                  ),
                  child: InkWell(
                    // change state selected of day for repeat here
                    onTap: () {},
                    child: Center(
                      child: Text(
                        'T3',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black54,
                  ),
                  child: InkWell(
                    // change state selected of day for repeat here
                    onTap: () {},
                    child: Center(
                      child: Text(
                        'T4',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black54,
                  ),
                  child: InkWell(
                    // change state selected of day for repeat here
                    onTap: () {},
                    child: Center(
                      child: Text(
                        'T5',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black54,
                  ),
                  child: InkWell(
                    // change state selected of day for repeat here
                    onTap: () {},
                    child: Center(
                      child: Text(
                        'T6',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black54,
                  ),
                  child: InkWell(
                    // change state selected of day for repeat here
                    onTap: () {},
                    child: Center(
                      child: Text(
                        'T7',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: Colors.black),
            Container(
              height: 70,
              margin: EdgeInsetsDirectional.only(top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SelectMission())),
                child: Row(children: <Widget>[
                  SizedBox(width: 50, child: Icon(Icons.alarm)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 35,
                          child: Text(
                            'Cách tắt báo thức',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          child: Text(
                            'repeat here',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 50, child: Icon(Icons.chevron_right)),
                ]),
              ),
            ),
            Container(
              height: 130,
              margin: EdgeInsetsDirectional.only(top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: <Widget>[
                  IntrinsicHeight(
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 50, child: Icon(Icons.volume_up)),
                        Expanded(
                          child: Slider(
                            value: _sliderValue,
                            max: 10,
                            onChanged: (double value) {
                              setState(() {
                                _sliderValue = value.ceilToDouble();
                                debugPrint(_sliderValue.toString());
                              });
                            },
                          ),
                        ),
                        VerticalDivider(
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 50, child: Icon(Icons.vibration, color: _vibrate?Colors.black:Colors.grey[400]),),
                        SizedBox(
                          width: 80, 
                          child: InkWell(
                            onTap: () { setState(() { _vibrate = !_vibrate; }); },
                            child: CupertinoSwitch(
                              value: _vibrate,
                              onChanged: (bool value) { setState(() { _vibrate = value; }); },
                            ),
                          ),
                        ),
                          
                      ],
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SelectMission())),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 50, child: Icon(Icons.audiotrack)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 35,
                                child: Text(
                                  'Ringtone',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                                child: Text(
                                  'Ringtone name',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 50, child: Icon(Icons.chevron_right)),
                      ],
                    ),
                  ),
                ],
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
                onTap: () => debugPrint('Open edit label'),
                child: Row(children: <Widget>[
                  SizedBox(
                      width: 50,
                      child: Transform.scale(
                        scaleX: -1,
                        child: Icon(
                          Icons.sell,
                        ),
                      )),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 35,
                          child: Text(
                            'Label',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                          child: Text(
                            'None',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 50, child: Icon(Icons.chevron_right)),
                ]),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsetsDirectional.only(top: 5, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                onTap: () => debugPrint('Deleted Alarm'),
                child: Center(
                  child: Text(
                    'Xóa',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        margin: EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: () {
            debugPrint('Saved alarm');
          },
          child: Center(
            child: Text(
              'Save',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

