import 'package:alarm_app/models/alarm_history.dart';
import 'package:alarm_app/models/database.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late DatabaseManagement database;

  late List<AlarmHistory> alarmHistory = [];

  @override
  void initState() {
    database = DatabaseManagement();
    getAlarHistorymData();
    super.initState();
  }

  void getAlarHistorymData() async {
    alarmHistory = await database.getAlarmHistory();
    setState(() {});
  }

  Icon getMissionIcon(missionType) {
    switch (missionType) {
      case 'math':
        return const Icon(Icons.calculate);
      case 'fast':
        return const Icon(Icons.bolt);
      case 'typing':
        return const Icon(Icons.keyboard);
      case 'scanning':
        return const Icon(Icons.qr_code_scanner);
      case 'step':
        return const Icon(Icons.directions_run);
      case 'photo':
        return const Icon(Icons.camera_alt);
      default:
        return const Icon(Icons.alarm);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.grey,
            child: ListView.builder(
              itemCount: alarmHistory.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(children: [
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            alarmHistory[index].alarmHistoryTime,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            alarmHistory[index].alarmHistoryDate,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ]),
                  ),
                  getMissionIcon(alarmHistory[index].alarmHistoryMissionType),
                ]),
              ),
            )));
  }
}
