import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/models/database.dart';
import 'package:alarm_app/models/ringtone.dart';
import 'package:alarm_app/screens/alarm_screens/alarm_preview.dart';
import 'package:alarm_app/screens/mission_screens/select_mission_screen.dart';
import 'package:alarm_app/screens/ringtone_screen/select_ringtone_screen.dart';
import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:alarm_app/widgets/select_repeat_weekDay.dart';
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
  List<Ringtone> ringtones = [];

  late DatabaseManagement database;

  @override
  void initState() {
    // deep copy alarm object
    _alarm = Alarm.fromMap(widget.alarm.toMap());
    scrollController =
        FixedExtentScrollController(initialItem: _alarm.alarmHour);
    controller.text = _alarm.alarmLabel;
    database = DatabaseManagement();
    getRingtones();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    controller.dispose();
    super.dispose();
  }

  void getRingtones() async {
    ringtones = await database.getRingtones();
    setState(() {});
  }

  Ringtone findRingtone(int id) =>
      (ringtones.firstWhere((i) => i.ringtoneId == id));

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
            MaterialButton(
              color: Colors.blueGrey,
              onPressed: () {
                Navigator.of(context).pop('');
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      );

  Future<void> getSelectedRingtoneId(BuildContext context) async {
    int selectedRingtoneId = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectRingtone(
          idRingtone: _alarm.alarmRingtoneId,
        ),
      ),
    );
    _alarm.alarmRingtoneId = selectedRingtoneId;
    setState(() {});
    debugPrint(_alarm.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.navigate_before, color: Colors.black),
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
                          setState(() {
                            _alarm.alarmHour = index;
                          });

                          debugPrint(_alarm.alarmHour.toString());
                        },
                        children: List<Widget>.generate(
                          24,
                          (int index) {
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
                              duration: const Duration(milliseconds: 10),
                              curve: Curves.ease);
                          setState(() {
                            _alarm.alarmMinute = index;
                          });
                          debugPrint(
                              'Selected Hour ${_alarm.alarmHour}, Selected minute ${_alarm.alarmMinute}');
                        },
                        children: List<Widget>.generate(
                          60,
                          (int index) {
                            return Center(
                              child: Text(
                                index < 10 ? '0$index' : index.toString(),
                                style: const TextStyle(
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
                  SelectRepeatWeekDay(
                    text: 'CN',
                    color: _alarm.sunday == 0
                        ? Colors.blueGrey.shade200
                        : Colors.blue,
                    onTap: () => setState(() {
                      _alarm.sunday = _alarm.sunday == 0 ? 1 : 0;
                      debugPrint(_alarm.sunday.toString());
                    }),
                  ),
                  SelectRepeatWeekDay(
                    text: 'T2',
                    color: _alarm.monday == 0
                        ? Colors.blueGrey.shade200
                        : Colors.blue,
                    onTap: () => setState(() {
                      _alarm.monday = _alarm.monday == 0 ? 1 : 0;
                      debugPrint(_alarm.monday.toString());
                    }),
                  ),
                  SelectRepeatWeekDay(
                    text: 'T3',
                    color: _alarm.tuesday == 0
                        ? Colors.blueGrey.shade200
                        : Colors.blue,
                    onTap: () => setState(() {
                      _alarm.tuesday = _alarm.tuesday == 0 ? 1 : 0;
                      debugPrint(_alarm.tuesday.toString());
                    }),
                  ),
                  SelectRepeatWeekDay(
                    text: 'T4',
                    color: _alarm.wednesday == 0
                        ? Colors.blueGrey.shade200
                        : Colors.blue,
                    onTap: () => setState(() {
                      _alarm.wednesday = _alarm.wednesday == 0 ? 1 : 0;
                      debugPrint(_alarm.wednesday.toString());
                    }),
                  ),
                  SelectRepeatWeekDay(
                    text: 'T5',
                    color: _alarm.thursday == 0
                        ? Colors.blueGrey.shade200
                        : Colors.blue,
                    onTap: () => setState(() {
                      _alarm.thursday = _alarm.thursday == 0 ? 1 : 0;
                      debugPrint(_alarm.thursday.toString());
                    }),
                  ),
                  SelectRepeatWeekDay(
                    text: 'T6',
                    color: _alarm.friday == 0
                        ? Colors.blueGrey.shade200
                        : Colors.blue,
                    onTap: () => setState(() {
                      _alarm.friday = _alarm.friday == 0 ? 1 : 0;
                      debugPrint(_alarm.friday.toString());
                    }),
                  ),
                  SelectRepeatWeekDay(
                    text: 'T7',
                    color: _alarm.saturday == 0
                        ? Colors.blueGrey.shade200
                        : Colors.blue,
                    onTap: () => setState(() {
                      _alarm.saturday = _alarm.saturday == 0 ? 1 : 0;
                      debugPrint(_alarm.saturday.toString());
                    }),
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
                  'Báo thức được đặt cho ${_alarm.getTimeLeftInString()} tính từ bây giờ',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade600,
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
                          const SizedBox(
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
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 50, child: Icon(Icons.chevron_right)),
                  ]),
                ),
              ),
              Container(
                height: 130,
                margin: const EdgeInsetsDirectional.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: <Widget>[
                    IntrinsicHeight(
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                              width: 50, child: Icon(Icons.volume_up)),
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
                            width: 30,
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
                      onTap: () => getSelectedRingtoneId(context),
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
                                const SizedBox(
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
                                    ringtones.isNotEmpty
                                        ? findRingtone(_alarm.alarmRingtoneId)
                                            .getName()
                                        : 'Ringtone name',
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
