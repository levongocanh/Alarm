import 'package:flutter/material.dart';

class HomePageNavigationBar extends StatefulWidget {
  const HomePageNavigationBar({Key? key}) : super(key: key);

  @override
  State<HomePageNavigationBar> createState() => _HomePageNavigationBarState();
}

class _HomePageNavigationBarState extends State<HomePageNavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Lịch sử',
      style: optionStyle,
    ),
    Text(
      'Index 1: Lịch sử',
      style: optionStyle,
    ),
    Text(
      'Index 2: Bắt đầu ngày mới',
      style: optionStyle,
    ),
    Text(
      'Index 3: Cài đặt',
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
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),

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
