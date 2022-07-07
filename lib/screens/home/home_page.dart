import 'package:flutter/material.dart';
import '../alarm_screens/alarm_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    AlarmHome(),

    // below widget will be replaced by [ListView] of List<AlarmHistory>
    // The AlarmHistory will be inserted into database whenever user
    // completed dismiss an alarm
    Text(
      'Index 1: Lịch sử - Coming soon',
      textAlign: TextAlign.center,
      softWrap: true,
      style: optionStyle,
    ),

    // below widget will be replaced by [NewDay]
    Text(
      'Index 2: Bắt đầu ngày mới - Coming soon',
      textAlign: TextAlign.center,
      softWrap: true,
      style: optionStyle,
    ),

    // below widget will be replaced by [SettingScreen]
    Text(
      'Index 3: Cài đặt - Coming soon',
      textAlign: TextAlign.center,
      softWrap: true,
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Báo thức',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            label: 'Lịch sử',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.art_track),
            label: 'Bắt đầu ngày mới',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Cài đặt',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
