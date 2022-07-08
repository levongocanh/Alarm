// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/models/database.dart';
import 'package:alarm_app/screens/alarm_screens/alarm_preview.dart';
import 'package:alarm_app/screens/mission_screens/select_mission_screen.dart';
import 'package:alarm_app/screens/ringtone_screen/select_ringtone_screen.dart';
import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:alarm_app/widgets/select_repeat_day.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  final Alarm alarm;
  const EditScreen({Key? key, required this.alarm}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late FixedExtentScrollController scrollController;
  TextEditingController controller = TextEditingController();
  late Alarm _alarm;
  late DatabaseManagement database;

  @override
  void initState() {
    // deep copy alarm object
    _alarm = Alarm.fromMap(widget.alarm.toMap());
    scrollController =
        FixedExtentScrollController(initialItem: _alarm.alarmHour);
    controller.text = _alarm.alarmLabel;
    database = DatabaseManagement();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    controller.dispose();
    super.dispose();
  }

  Future<String?> openEditLabel() => showDialog<String?>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Label'),
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(
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
              child: const Text('OK'),
            ),

            // This cancel button will be re-opened when I found a way to return the old text
            // MaterialButton(
            //   color: Colors.blueGrey,
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            //   child: Text('Cancel'),
            // ),
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
                Navigator.of(context).pop('');
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
            hoverColor: Colors.transparent,
            onPressed: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PreviewAlarm(
                            alarm: _alarm,
                          )));
            },
            child: const Icon(Icons.visibility),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsetsDirectional.only(start: 15, end: 15, top: 15),
        child: ScrollConfiguration(
          // disabled scrollbar
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            children: <Widget>[
              Container(
                height: 150,
                color: Colors.grey.shade200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 80,
                      child: CupertinoPicker(
                        itemExtent: 50,
                        looping: true,
                        squeeze: 1, // display 3 items at time
                        magnification: 1, // does not zoom the selected item
                        diameterRatio:
                            10, // set high value for flat wheel scroll
                        scrollController: scrollController,
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
                          _alarm.alarmHour = index;
                          debugPrint(_alarm.alarmHour.toString());
                        },
                        children: List<Widget>.generate(
                          24,
                          (int index) {
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
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        ':',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                    ),
                    SizedBox(
                      width: 80,
                      child: CupertinoPicker(
                        itemExtent: 50,
                        looping: true,
                        squeeze: 1,
                        magnification: 1,
                        diameterRatio: 10,
                        scrollController: FixedExtentScrollController(
                            initialItem: _alarm.alarmMinute),
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
                          if (index == 0 && _alarm.alarmMinute == 59) {
                            _alarm.alarmHour = (_alarm.alarmHour + 1) % 24;
                          } else if (index == 59 && _alarm.alarmMinute == 0) {
                            _alarm.alarmHour = (_alarm.alarmHour - 1) % 24;
                          }
                          scrollController.animateTo(_alarm.alarmHour * 50,
                              duration: Duration(milliseconds: 10),
                              curve: Curves.ease);
                          _alarm.alarmMinute = index;

                          debugPrint(
                              'Selected Hour ${_alarm.alarmHour}, Selected minute ${_alarm.alarmMinute}');
                        },
                        children: List<Widget>.generate(
                          60,
                          (int index) {
                            return Center(
                              child: Text(
                                index < 10 ? '0$index' : index.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 35),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SelectRepeatDay(
                    text: 'CN',
                    onTap: () => setState(() {
                      _alarm.sunday = _alarm.sunday == 0 ? 1 : 0;
                      debugPrint(_alarm.sunday.toString());
                    }),
                    color: _alarm.sunday == 0 ? Colors.black54 : Colors.blue,
                  ),
                  SelectRepeatDay(
                    text: 'T2',
                    onTap: () => setState(() {
                      _alarm.monday = _alarm.monday == 0 ? 1 : 0;
                      debugPrint(_alarm.monday.toString());
                    }),
                    color: _alarm.monday == 0 ? Colors.black54 : Colors.blue,
                  ),
                  SelectRepeatDay(
                    text: 'T3',
                    onTap: () => setState(() {
                      _alarm.tuesday = _alarm.tuesday == 0 ? 1 : 0;
                      debugPrint(_alarm.tuesday.toString());
                    }),
                    color: _alarm.tuesday == 0 ? Colors.black54 : Colors.blue,
                  ),
                  SelectRepeatDay(
                    text: 'T4',
                    onTap: () => setState(() {
                      _alarm.wednesday = _alarm.wednesday == 0 ? 1 : 0;
                      debugPrint(_alarm.wednesday.toString());
                    }),
                    color: _alarm.wednesday == 0 ? Colors.black54 : Colors.blue,
                  ),
                  SelectRepeatDay(
                    text: 'T5',
                    onTap: () => setState(() {
                      _alarm.thursday = _alarm.thursday == 0 ? 1 : 0;
                      debugPrint(_alarm.thursday.toString());
                    }),
                    color: _alarm.thursday == 0 ? Colors.black54 : Colors.blue,
                  ),
                  SelectRepeatDay(
                    text: 'T6',
                    onTap: () => setState(() {
                      _alarm.friday = _alarm.friday == 0 ? 1 : 0;
                      debugPrint(_alarm.friday.toString());
                    }),
                    color: _alarm.friday == 0 ? Colors.black54 : Colors.blue,
                  ),
                  SelectRepeatDay(
                    text: 'T7',
                    onTap: () => setState(() {
                      _alarm.saturday = _alarm.saturday == 0 ? 1 : 0;
                      debugPrint(_alarm.saturday.toString());
                    }),
                    color: _alarm.saturday == 0 ? Colors.black54 : Colors.blue,
                  ),
                ],
              ),
              Container(
                height: 35,
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  _alarm.getTimeLeft()!,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),
              const Divider(color: Colors.black),
              Container(
                height: 70,
                margin: const EdgeInsetsDirectional.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: () async {
                    var result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectMission(
                                alarm: _alarm,
                              )),
                    );
                    if (result != null) {
                      setState(() {
                        _alarm = result;
                      });
                    }
                  },
                  child: Row(children: <Widget>[
                    const SizedBox(width: 50, child: Icon(Icons.alarm)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 45,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Cách tắt báo thức',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                            child: Text(
                              softWrap: true,
                              _alarm.getMissionDisplayName(),
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
                              value: _alarm.alarmVolume.toDouble(),
                              max: 10,
                              onChanged: (double value) {
                                if (value.ceilToDouble() !=
                                    _alarm.alarmVolume.toDouble()) {
                                  setState(() {
                                    _alarm.alarmVolume =
                                        value.ceilToDouble().toInt();
                                    debugPrint(_alarm.alarmVolume.toString());
                                  });
                                }
                              },
                            ),
                          ),
                          const VerticalDivider(
                            thickness: 1,
                            indent: 10,
                            endIndent: 10,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 50,
                            child: Icon(Icons.vibration,
                                color: _alarm.alarmVibrate == 0
                                    ? Colors.grey.shade400
                                    : Colors.black),
                          ),
                          SizedBox(
                            width: 80,
                            child: Switch(
                              value: _alarm.alarmVibrate == 0 ? false : true,
                              onChanged: (bool value) {
                                setState(() {
                                  _alarm.alarmVibrate = value ? 1 : 0;
                                });
                              },
                            ),
                            // ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectRingtone(
                            idRingtone: _alarm.alarmRingtoneId,
                          ),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 50,
                            child: Icon(Icons.audiotrack),
                          ),
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
                          const SizedBox(
                            width: 50,
                            child: Icon(Icons.chevron_right),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                margin: const EdgeInsetsDirectional.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: () async {
                    final String? label = await openEditLabel();
                    if (label == null || label.isEmpty) {
                      setState(() {
                        _alarm.alarmLabel = '';
                      });
                    } else {
                      setState(() {
                        _alarm.alarmLabel = label;
                      });
                    }
                  },
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 50,
                        child: Transform.scale(
                          scaleX: -1,
                          child: const Icon(
                            Icons.sell,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 45,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Label',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                              child: Text(
                                _alarm.alarmLabel == ''
                                    ? 'None'
                                    : _alarm.alarmLabel,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                        child: Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                ),
              ),
              BottomButton(
                height: 55,
                text: 'Xóa',
                onTap: () => debugPrint(_alarm.toString()),
                color: Colors.grey,
                margin: const EdgeInsetsDirectional.all(0),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomButton(
        text: 'Save',
        onTap: () {
          // make sure alarm [isActive] == true
          if (_alarm.isActive == 0) {
            _alarm.isActive = 1;
          }
          // if [alarmId] == null: this is creating new alarm
          // else: this is editing alarm
          _alarm.alarmId == null
              ? database.insertAlarm(_alarm)
              : database.updateAlarm(_alarm, _alarm.alarmId!);
          Navigator.of(context).pop();
          debugPrint('Saved alarm');
        },
      ),
    );
  }
}
