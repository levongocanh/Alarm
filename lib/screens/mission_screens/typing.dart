// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TypingMission extends StatefulWidget {
  const TypingMission({Key? key}) : super(key: key);

  @override
  State<TypingMission> createState() => _TypingMissionState();
}

class _TypingMissionState extends State<TypingMission> {
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
            'Typing',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [],
        ));
  }
}