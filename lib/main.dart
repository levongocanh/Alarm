// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_final_fields
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() => runApp(MaterialApp(
      home: const MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

// enum Menu { itemOne, itemTwo, itemThree, itemFour }

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
                      Container(
                          child: Text(
                        'HH:MM',
                        style: TextStyle(fontSize: 35),
                      )),
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

          // Card(
          //   child: InkWell(
          //     onTap: () {
          //       debugPrint('Card tapped.');
          //     },
          //     child: Container(
          //       height: 85,
          //       color: Colors.grey[100],
          //       child: Row(
          //         children: <Widget>[
          //           Checkbox(
          //             value: isChecked,
          //             onChanged: (bool? value) {
          //               setState(() {
          //                 isChecked = value;
          //               });
          //             }),
          //             Container(),

          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ]),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        openCloseDial: isDialOpen,
        backgroundColor: Colors.blue,
        overlayOpacity: 0,
        spacing: 10,
        spaceBetweenChildren: 10,
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

class EditScreen extends StatefulWidget {
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  double sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.navigate_before, color: Colors.black),
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
        margin: EdgeInsetsDirectional.all(15),
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
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SelectMission()));
                },
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
              height: 140,
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
                            value: sliderValue,
                            max: 10,
                            onChanged: (double value) {
                              setState(() {
                                sliderValue = value.ceilToDouble();
                                debugPrint(sliderValue.toString());
                              });
                            },
                          ),
                        ),
                        VerticalDivider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 50, child: Icon(Icons.vibration)),
                        SizedBox(width: 50, child: Icon(Icons.vibration)),
                      ],
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectRingtone()));
                    },
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 50, child: Icon(Icons.audiotrack)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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

class SelectMission extends StatefulWidget {
  const SelectMission({Key? key}) : super(key: key);

  @override
  State<SelectMission> createState() => _SelectMissionState();
}

class _SelectMissionState extends State<SelectMission> {
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
            'Select Mission',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [],
        ));
  }
}

class SelectRingtone extends StatefulWidget {
  const SelectRingtone({Key? key}) : super(key: key);

  @override
  State<SelectRingtone> createState() => _SelectRingtoneState();
}

class _SelectRingtoneState extends State<SelectRingtone> {
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
            'Select Ringtone',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [],
        ));
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
