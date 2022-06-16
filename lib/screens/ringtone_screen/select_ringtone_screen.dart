// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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