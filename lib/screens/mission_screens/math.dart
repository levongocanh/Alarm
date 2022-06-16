// ignore_for_file: prefer_const_constructors

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
        bottomNavigationBar: Container(
          height: 60,
          margin: EdgeInsetsDirectional.all(10),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
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