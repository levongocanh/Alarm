// ignore_for_file: unused_import, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/models/database.dart';
import 'package:alarm_app/screens/alarm_screens/alarm_edit.dart';
import 'package:alarm_app/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sqflite/sqflite.dart';

class AlarmHome extends StatefulWidget {
  const AlarmHome({Key? key}) : super(key: key);

  @override
  State<AlarmHome> createState() => _AlarmHomeState();
}

class _AlarmHomeState extends State<AlarmHome> {
  bool? isChecked = false;
  bool isActive = false;
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  List<Alarm> _alarms = [];

  late DatabaseManagement database;
  @override
  void initState() {
    database = DatabaseManagement();
    getAlarmData();
    super.initState();
  }

  void getAlarmData() async {
    _alarms = await database.getAlarms();
    setState(() {});
  }

  Icon getMissionIcon(Alarm alarm) {
    if (alarm.alarmType == 'fast') {
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
              'Không có báo thức sắp tới',
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
            height: 85,
            margin: const EdgeInsets.all(5),
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
                      // delete fast alarm when it isn't active [isActive = false]
                      if (_alarms[index].alarmType == 'fast' &&
                          value! == false) {
                        database.deleteAlarm(_alarms[index].alarmId!);
                        getAlarmData();
                      } else {
                        setState(() {
                          _alarms[index].isActive = value! == false ? 0 : 1;
                          // update database whenever the [isActive] changed
                          database.updateAlarm(
                              _alarms[index], _alarms[index].alarmId!);
                          debugPrint(value ? 'true' : 'false');
                        });
                      }
                    }),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditScreen(
                            alarm: _alarms[index],
                          ),
                          // settings: RouteSettings(arguments: _alarms[index]),
                        ),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 100,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            _alarms[index].getDisplayTime(),
                            style: TextStyle(fontSize: 35),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _alarms[index].alarmLabel == ''
                                    ? 'test label'
                                    : _alarms[index].alarmLabel,
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
                Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value;
                      });
                    }),
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
              debugPrint('Đã mở tạo báo thức');
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.bolt),
            label: 'Báo thức nhanh',
            backgroundColor: Colors.blue,
            onTap: () {
              debugPrint('Đã mở tạo báo thức nhanh');
            },
          ),
        ],
      ),
    );
  }
}
