// ignore_for_file: prefer_const_constructors

import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:flutter/material.dart';

class MathMission extends StatefulWidget {
  const MathMission({Key? key}) : super(key: key);

  @override
  State<MathMission> createState() => _MathMissionState();
}

class _MathMissionState extends State<MathMission> {
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
            'Giải toán',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [],
        ),
        bottomNavigationBar: BottomButton(
        text: 'Save',
        onTap: () {
            Navigator.of(context).pop();
            debugPrint('Selected Math Mission');
          },
        ), 
      );
  }
}