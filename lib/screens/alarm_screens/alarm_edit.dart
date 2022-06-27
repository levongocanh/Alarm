// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:alarm_app/screens/mission_screens/select_mission_screen.dart';
import 'package:alarm_app/screens/ringtone_screen/select_ringtone_screen.dart';
import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:alarm_app/widgets/select_repeat_day.dart';
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
  bool _sunday = false;
  bool _monday = false;
  bool _tueday = false;
  bool _wednesday = false;
  bool _thursday = false;
  bool _friday = false;
  bool _saturday = false;
  String label = '';

  TextEditingController controller = TextEditingController();
  
  Future<String?> openEditLabel() => showDialog<String?>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Label'),
      content: TextField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Please enter a label',
        ),
        controller: controller,
      ),
      actions: [
        MaterialButton(
          color: Colors.blueAccent,
          onPressed: () {
            Navigator.of(context).pop(controller.text);
          },
          child: Text('OK'),
        ),
        MaterialButton(
          color: Colors.blueGrey,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    ),
  );

  Future<String?> openDeleteConfirmationForm() => showDialog<String?>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Label'),
      content: TextField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Please enter a label',
        ),
        controller: controller,
      ),
      actions: [
        MaterialButton(
          color: Colors.blueAccent,
          onPressed: () {
            Navigator.of(context).pop(controller.text);
          },
          child: Text('OK'),
        ),
        MaterialButton(
          color: Colors.blueGrey,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    ),
  );
  
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
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SelectRepeatDay(
                  text: 'CN',
                  onTap: () => setState(() {
                    _sunday = !_sunday;
                    debugPrint(_sunday.toString());
                  }),
                  color: _sunday?Colors.blue:Colors.black54,
                ),

                SelectRepeatDay(
                  text: 'T2',
                  onTap: () => setState(() {
                    _monday = !_monday;
                    debugPrint(_monday.toString());
                  }),
                  color: _monday?Colors.blue:Colors.black54,
                ),

                SelectRepeatDay(
                  text: 'T3',
                  onTap: () => setState(() {
                    _tueday = !_tueday;
                    debugPrint(_tueday.toString());
                  }),
                  color: _tueday?Colors.blue:Colors.black54,
                ),

                SelectRepeatDay(
                  text: 'T4',
                  onTap: () => setState(() {
                    _wednesday = !_wednesday;
                    debugPrint(_wednesday.toString());
                  }),
                  color: _wednesday?Colors.blue:Colors.black54,
                ),

                SelectRepeatDay(
                  text: 'T5',
                  onTap: () => setState(() {
                    _thursday = !_thursday;
                    debugPrint(_thursday.toString());
                  }),
                  color: _thursday?Colors.blue:Colors.black54,
                ),

                SelectRepeatDay(
                  text: 'T6',
                  onTap: () => setState(() {
                    _friday = !_friday;
                    debugPrint(_friday.toString());
                  }),
                  color: _friday?Colors.blue:Colors.black54,
                ),

                SelectRepeatDay(
                  text: 'T7',
                  onTap: () => setState(() {
                    _saturday = !_saturday;
                    debugPrint(_saturday.toString());
                  }),
                  color: _saturday?Colors.blue:Colors.black54,
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
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SelectRingtone())),
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
                onTap: () async {
                  final String? _label = await openEditLabel();
                  if (_label==null || _label.isEmpty) {
                    setState(() {
                      label = '';
                    });
                  }
                  else {
                    setState(() {
                      label = _label;
                    });
                  }
                },
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
                            label==''?'None':label,
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
      bottomNavigationBar: BottomButton(
        text: 'Save',
        onTap: () {
            Navigator.of(context).pop();
            debugPrint('Saved alarm');
          },
      ), 
    );
  }
}