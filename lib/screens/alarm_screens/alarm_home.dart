// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/models/database.dart';
import 'package:alarm_app/screens/alarm_screens/alarm_edit.dart';
import 'package:alarm_app/screens/alarm_screens/dismiss_alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';

final List<String> buttons = [
  '1',
  '5',
  '10',
  'vibrate',
  '15',
  '30',
  '60',
  'refresh',
];

class AlarmHome extends StatefulWidget {
  const AlarmHome({Key? key}) : super(key: key);

  @override
  State<AlarmHome> createState() => _AlarmHomeState();
}

class _AlarmHomeState extends State<AlarmHome> {
  bool? isChecked = false;
  bool isActive = false;
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  String nextAlarm = '';
  List<Alarm> _alarms = [];

  int quickAlarmTime = 0;

  late DatabaseManagement database;
  @override
  void initState() {
    database = DatabaseManagement();
    getAlarmData();
    super.initState();
  }

  void getAlarmData() async {
    _alarms = await database.getAlarms();

    // sort by [isActive] => [alarmHour] => [alarmMinute]
    _alarms.sort((a, b) => a.alarmMinute.compareTo(b.alarmMinute));
    _alarms.sort((a, b) => a.alarmHour.compareTo(b.alarmHour));
    _alarms.sort((a, b) => b.isActive.compareTo(a.isActive));

    nextAlarm =
        _alarms[0].isActive == 1 ? _alarms[0].getTimeLeftInString() : '';

    setState(() {});
  }

  Icon getMissionIcon(Alarm alarm) {
    if (alarm.alarmType == 'quick') {
      return Icon(Icons.bolt);
    } else {
      switch (alarm.alarmMissionType) {
        case 'default':
          return Icon(Icons.alarm);
        case 'math':
          return Icon(Icons.calculate);
        default:
          return Icon(Icons.alarm);
      }
    }
  }

  Future<void> _navigateEditAlarm(BuildContext context, Alarm alarm) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditScreen(
          alarm: alarm,
        ),
      ),
    );

    if (!mounted) {
      return;
    } else {
      getAlarmData();
    }
  }
  // Future<String?> openCreateQuickAlarm() async => showDialog<String?>(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Báo thức nhanh'),
  //         content: SizedBox(
  //           width: 300,
  //           height: 300,
  //           child: Column(
  //             children: [
  //               Text(
  //                 '+${DateFormat.Hm().format(DateFormat.Hm().parse('${quickAlarmTime ~/ 60}:${quickAlarmTime % 60}'))}',
  //                 style: TextStyle(
  //                   fontSize: 50,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //               SizedBox(
  //                 width: 300,
  //                 height: 200,
  //                 child: GridView.builder(
  //                   itemCount: buttons.length,
  //                   gridDelegate:
  //                       const SliverGridDelegateWithFixedCrossAxisCount(
  //                           crossAxisCount: 4),
  //                   itemBuilder: (BuildContext context, int index) {
  //                     // vibrate Button
  //                     if (buttons[index] == 'vibrate') {
  //                       return Padding(
  //                         padding: EdgeInsets.all(3),
  //                         child: ElevatedButton(
  //                           child: Icon(Icons.volume_up),
  //                           onPressed: () => {},
  //                         ),
  //                       );
  //                     }

  //                     // refresh button
  //                     else if (buttons[index] == 'refresh') {
  //                       return Padding(
  //                         padding: EdgeInsets.all(3),
  //                         child: ElevatedButton(
  //                           child: Icon(Icons.refresh),
  //                           onPressed: () {
  //                             quickAlarmTime = 0;
  //                           },
  //                         ),
  //                       );
  //                     }

  //                     //  increase minute buttons
  //                     else {
  //                       return Padding(
  //                         padding: EdgeInsets.all(3),
  //                         child: OutlinedButton(
  //                           child: Text('${buttons[index]}m'),
  //                           onPressed: () {
  //                             debugPrint((buttons[index].toString()));
  //                             setState() {
  //                               quickAlarmTime = quickAlarmTime + int.parse(buttons[index]);
  //                             }
  //                             debugPrint(quickAlarmTime.toString());
  //                           },
  //                         ),
  //                       );
  //                     }
  //                   },
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop('Cancel');
  //             },
  //             child: Text('Hủy'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop('Success');
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.transparent,
        toolbarHeight: 80,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Báo thức tiếp theo',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[400],
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              nextAlarm.isNotEmpty
                  ? 'Còn $nextAlarm'
                  : 'Không có báo thức sắp tới',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.grey[600],
        child: ListView.builder(
          itemCount: _alarms.length,
          itemBuilder: (context, index) => Container(
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: _alarms[index].isActive == 1
                  ? Colors.grey[100]
                  : Colors.grey[400],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Checkbox(
                    value: _alarms[index].isActive == 0 ? false : true,
                    onChanged: (bool? value) {
                      // delete quick alarm when it isn't active [isActive = false]
                      if (_alarms[index].alarmType == 'quick' &&
                          value! == false) {
                        database.deleteAlarm(_alarms[index].alarmId!);
                      } else {
                        _alarms[index].isActive = value! == false ? 0 : 1;
                        // update database whenever the [isActive] changed
                        database.updateAlarm(
                            _alarms[index], _alarms[index].alarmId!);
                        // debugPrint(value ? 'true' : 'false');
                      }
                      getAlarmData();
                    }),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      if (_alarms[index].alarmType == 'quick') {
                        debugPrint('Không thể thay đổi báo thức nhanh.');
                      } else {
                        await _navigateEditAlarm(context, _alarms[index]);
                      }
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 100,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            _alarms[index].getDisplayTime(),
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // only display alarm label when [alarmLabel] != ''
                              if (_alarms[index].alarmLabel.isNotEmpty)
                                Text(
                                  _alarms[index].alarmLabel,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 20),
                                ),
                              Text(
                                _alarms[index].getRepeatDisplay(),
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        _alarms[index].getDisplayMission(),
                      ],
                    ),
                  ),
                ),
                PopupMenuButton(
                  offset: Offset(0, 100),
                  onSelected: (value) async {
                    switch (value) {
                      case 0: // delete alarm
                        database.deleteAlarm(_alarms[index].alarmId!);
                        getAlarmData();
                        break;
                      case 1: // Preview alarm
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DismissAlarm(
                                      alarm: _alarms[index],
                                    )));
                        break;
                      case 2: // duplicate alarm
                        // deep copy alarm properties
                        var alarm = Alarm.fromMap(_alarms[index].toMap());

                        // set [alarmId] = null to avoid conflict when insert into table
                        alarm.alarmId = null;

                        database.insertAlarm(alarm);
                        getAlarmData();
                        break;
                      default:
                        break;
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 0,
                      child: ListTile(
                        leading: const Icon(Icons.delete),
                        title: Text(
                          'Xóa',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: 1,
                      child: ListTile(
                        leading: const Icon(Icons.visibility),
                        title: Text(
                          'Xem báo thức',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: const ListTile(
                        leading: Icon(Icons.copy),
                        title: Text(
                          'Sao chép báo thức',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        openCloseDial: isDialOpen,
        backgroundColor: Colors.blue,
        overlayOpacity: 0,
        spacing: 10,
        spaceBetweenChildren: 10,
        childrenButtonSize: const Size.square(66),
        buttonSize: const Size.square(56),
        closeManually: false,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.alarm),
            label: 'Báo thức',
            backgroundColor: Colors.blue,
            onTap: () {
              var date = DateTime.now();
              var defaultAlarm = Alarm(
                  isActive: 1,
                  alarmType: 'normal',
                  alarmHour: int.parse(DateFormat.H().format(date)),
                  alarmMinute: int.parse(DateFormat.m().format(date)) + 1,
                  alarmRingtoneId: 1,
                  alarmVolume: 8,
                  alarmLabel: '',
                  alarmVibrate: 1,
                  sunday: 0,
                  monday: 1,
                  tuesday: 1,
                  wednesday: 1,
                  thursday: 1,
                  friday: 1,
                  saturday: 0,
                  alarmMissionType: 'default');
              _navigateEditAlarm(context, defaultAlarm);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.bolt),
            label: 'Báo thức nhanh',
            backgroundColor: Colors.blue,
            onTap: () {
              setState(() {
                quickAlarmTime = 0;
              });
              // openCreateQuickAlarm();
              debugPrint('Đã mở tạo báo thức nhanh');
            },
          ),
        ],
      ),
    );
  }
}
