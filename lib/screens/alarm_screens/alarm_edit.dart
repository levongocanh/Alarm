// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:alarm_app/screens/alarm_screens/alarm_preview.dart';
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
  // bellow variables will replaced by alarm properties
  double _sliderValue = 0;
  bool _vibrate = false;
  bool _sunday = false;
  bool _monday = false;
  bool _tueday = false;
  bool _wednesday = false;
  bool _thursday = false;
  bool _friday = false;
  bool _saturday = false;
  String _label = '';
  int _selectedHour = 1;
  int _selectedMinute = 30;
  String _missionType = 'default';

  late FixedExtentScrollController scrollController;

  @override
  void initState() {
    scrollController = FixedExtentScrollController(initialItem: _selectedHour);
    super.initState();
  }

  TextEditingController controller = TextEditingController();

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

            // This cancel button will be re-open when I found a way to return old text
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
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PreviewAlarm()));
              debugPrint('Open Preview Alarm');
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
                          setState(() {
                            _selectedHour = index;
                          });
                          debugPrint(_selectedHour.toString());
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
                            initialItem: _selectedMinute),
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
                          if (index == 0 && _selectedMinute == 59) {
                            _selectedHour = (_selectedHour + 1) % 24;
                          } else if (index == 59 && _selectedMinute == 0) {
                            _selectedHour = (_selectedHour - 1) % 24;
                          }
                          scrollController.animateTo(_selectedHour * 50,
                              duration: Duration(milliseconds: 10),
                              curve: Curves.ease);
                          _selectedMinute = index;

                          debugPrint(
                              'Selected Hour $_selectedHour, Selected minute $_selectedMinute');
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
                      _sunday = !_sunday;
                      debugPrint(_sunday.toString());
                    }),
                    color: _sunday ? Colors.blue : Colors.black54,
                  ),
                  SelectRepeatDay(
                    text: 'T2',
                    onTap: () => setState(() {
                      _monday = !_monday;
                      debugPrint(_monday.toString());
                    }),
                    color: _monday ? Colors.blue : Colors.black54,
                  ),
                  SelectRepeatDay(
                    text: 'T3',
                    onTap: () => setState(() {
                      _tueday = !_tueday;
                      debugPrint(_tueday.toString());
                    }),
                    color: _tueday ? Colors.blue : Colors.black54,
                  ),
                  SelectRepeatDay(
                    text: 'T4',
                    onTap: () => setState(() {
                      _wednesday = !_wednesday;
                      debugPrint(_wednesday.toString());
                    }),
                    color: _wednesday ? Colors.blue : Colors.black54,
                  ),
                  SelectRepeatDay(
                    text: 'T5',
                    onTap: () => setState(() {
                      _thursday = !_thursday;
                      debugPrint(_thursday.toString());
                    }),
                    color: _thursday ? Colors.blue : Colors.black54,
                  ),
                  SelectRepeatDay(
                    text: 'T6',
                    onTap: () => setState(() {
                      _friday = !_friday;
                      debugPrint(_friday.toString());
                    }),
                    color: _friday ? Colors.blue : Colors.black54,
                  ),
                  SelectRepeatDay(
                    text: 'T7',
                    onTap: () => setState(() {
                      _saturday = !_saturday;
                      debugPrint(_saturday.toString());
                    }),
                    color: _saturday ? Colors.blue : Colors.black54,
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
                  "Time left",
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
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SelectMission())),
                  child: Row(children: <Widget>[
                    const SizedBox(width: 50, child: Icon(Icons.alarm)),
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
                              softWrap: true,
                              'Selected mission to dismiss your alarm here',
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
                                if (value.ceilToDouble() != _sliderValue) {
                                  setState(() {
                                    _sliderValue = value.ceilToDouble();
                                    debugPrint(_sliderValue.toString());
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
                                color: _vibrate
                                    ? Colors.black
                                    : Colors.grey.shade400),
                          ),
                          SizedBox(
                            width: 80,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _vibrate = !_vibrate;
                                });
                              },
                              child: Switch(
                                value: _vibrate,
                                onChanged: (bool value) {
                                  setState(() {
                                    _vibrate = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectRingtone(),
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
                        _label = '';
                      });
                    } else {
                      setState(() {
                        _label = label;
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
                                _label == '' ? 'None' : _label,
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
                onTap: () => debugPrint('Deleted Alarm'),
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
          Navigator.of(context).pop();
          debugPrint('Saved alarm');
        },
      ),
    );
  }
}