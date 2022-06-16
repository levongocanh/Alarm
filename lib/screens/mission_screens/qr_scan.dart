// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ScanQRMission extends StatefulWidget {
  const ScanQRMission({Key? key}) : super(key: key);

  @override
  State<ScanQRMission> createState() => _ScanQRMissionState();
}

class _ScanQRMissionState extends State<ScanQRMission> {
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
            'Quét mã vạch',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [],
        ));
  }
}