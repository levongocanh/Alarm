// ignore_for_file: unused_import, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:alarm_app/screens/alarm_screens/alarm_edit.dart';
import 'package:alarm_app/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isChecked = false;
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  // String selectedMenu = '';

  Icon getMissionIcon(Alarm _alarm) {
    return Icon(Icons.alarm);
  }

  Alarm _defaultAlarm = Alarm(
    id: 0,
    type: 'normal',
    trackId: 5,
    volume: 5,
    hour: 5,
    minute: 30,
    label: 'Wake up please',
    vibrate: true,
    missionType: 'Default',
    missionLevel: 0,
    isActive: false,
    monday: true,
    tuesday: false,
    wednesday: true,
    thursday: true,
    friday: true,
    saturday: false,
    sunday: false,
  );

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
        child: ListView(children: <Widget>[
          Container(
            height: 85,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[100],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Checkbox(
                    value: _defaultAlarm.isActive,
                    onChanged: (bool? value) {
                      setState(() {
                        _defaultAlarm.isActive = value!;
                        debugPrint(value ? 'true' : 'false');
                      });
                    }),
                Expanded(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditScreen()));
                  },
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'HH:MM',
                          style: TextStyle(fontSize: 35),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                              child: Text(
                                'label here',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                              child: Text(
                                'repeat here',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.alarm,
                        size: 30.0,
                      ),
                    ],
                  ),
                )),
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
        ]),
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
              }),
          SpeedDialChild(
              child: const Icon(Icons.bolt),
              label: 'Báo thức nhanh',
              backgroundColor: Colors.blue,
              onTap: () {
                debugPrint('Đã mở tạo báo thức nhanh');
              }),
        ],
      ),
    );
  }
}

// ---------------------------------------------
//  Below this line are helper classes and data

Map<int, Alarm> _alarmList = {
  0: Alarm(
    id: 0,
    type: 'normal',
    trackId: 5,
    volume: 5,
    hour: 5,
    minute: 30,
    label: 'Wake up!!!!',
    vibrate: true,
    missionType: 'Default',
    missionLevel: 0,
    isActive: false,
    monday: true,
    tuesday: false,
    wednesday: true,
    thursday: true,
    friday: true,
    saturday: false,
    sunday: false,
  ),
  1: Alarm(
    id: 1,
    type: 'normal',
    trackId: 5,
    volume: 5,
    hour: 5,
    minute: 30,
    label: 'Wake up!!!',
    vibrate: true,
    missionType: 'Math',
    missionLevel: 1,
    isActive: false,
    monday: true,
    tuesday: false,
    wednesday: true,
    thursday: true,
    friday: true,
    saturday: false,
    sunday: false,
  ),
  2: Alarm(
    id: 0,
    type: 'normal',
    trackId: 5,
    volume: 5,
    hour: 5,
    minute: 30,
    label: 'Wake up!!!!',
    vibrate: true,
    missionType: 'Default',
    missionLevel: 0,
    isActive: true,
    monday: true,
    tuesday: false,
    wednesday: true,
    thursday: true,
    friday: true,
    saturday: false,
    sunday: false,
  ),
  3: Alarm(
    id: 3,
    type: 'fast',
    trackId: 5,
    volume: 5,
    hour: 5,
    minute: 30,
    label: 'Wake up!',
    vibrate: true,
    missionType: 'Default',
    missionLevel: 0,
    isActive: false,
    monday: true,
    tuesday: false,
    wednesday: true,
    thursday: true,
    friday: true,
    saturday: false,
    sunday: false,
  ),
};

class Server {
  static List<Alarm> getAlarmList() => _alarmList.values.toList();

  static Alarm getAlarmByID(int id) {
    assert(id >= 0 && id <= 6);
    return _alarmList[id]!;
  }
}

class Alarm {
  int id;
  String type;
  int trackId;
  int volume;
  int hour;
  int minute;
  String label;
  bool vibrate;
  String missionType;
  int missionLevel;
  bool isActive;
  bool monday;
  bool tuesday;
  bool wednesday;
  bool thursday;
  bool friday;
  bool saturday;
  bool sunday;

  Alarm({
    required this.id,
    required this.type,
    required this.trackId,
    required this.volume,
    required this.hour,
    required this.minute,
    required this.label,
    required this.vibrate,
    required this.missionType,
    required this.missionLevel,
    required this.isActive,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });
}
