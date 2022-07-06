// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../models/ringtone.dart';
import '../../widgets/bottom_button.dart';

var isChoice = 10;

var DUMMY_DATA = [
  Ringtone(ringtoneId: 1, ringtonePath: 'assets/ringtones/bad_to_bone.mp3'),
  Ringtone(ringtoneId: 2, ringtonePath: 'assets/ringtones/eminem.mp3'),
  Ringtone(ringtoneId: 3, ringtonePath: 'assets/ringtones/fancy_like.mp3'),
  Ringtone(ringtoneId: 4, ringtonePath: 'assets/ringtones/its_your_mother.mp3'),
  Ringtone(ringtoneId: 5, ringtonePath: 'assets/ringtones/my_baby.mp3'),
  Ringtone(ringtoneId: 6, ringtonePath: 'assets/ringtones/suga_boom_boom.mp3'),
  Ringtone(
      ringtoneId: 7, ringtonePath: 'assets/ringtones/welcome_to_my_home.mp3'),
];

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black, width: 1)),
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: DUMMY_DATA.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => setState(() {
                    isChoice = DUMMY_DATA[index].ringtoneId!;
                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: isChoice != DUMMY_DATA[index].ringtoneId
                              ? Colors.transparent
                              : Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.black, width: 2)),
                      height: 80,
                      child: Center(
                          child: Text(
                        '${DUMMY_DATA[index].getName()}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      )),
                    ),
                  ),
                );
              }),
        ),
      ),
      bottomNavigationBar: BottomButton(
        text: 'Save',
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
