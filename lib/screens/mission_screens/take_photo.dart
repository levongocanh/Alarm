// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TakePhotoMission extends StatefulWidget {
  const TakePhotoMission({Key? key}) : super(key: key);

  @override
  State<TakePhotoMission> createState() => _TakePhotoMissionState();
}

class _TakePhotoMissionState extends State<TakePhotoMission> {
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
            'Chụp ảnh',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [],
        ));
  }
}