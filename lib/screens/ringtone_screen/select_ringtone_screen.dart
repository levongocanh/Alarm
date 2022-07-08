// ignore_for_file: prefer_const_constructors

import 'package:alarm_app/models/database.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:alarm_app/models/ringtone.dart';
import 'package:alarm_app/widgets/bottom_button.dart';

// var isChoice = 10;

// var DUMMY_DATA = [
//   Ringtone(ringtoneId: 1, ringtonePath: 'assets/ringtones/bad_to_bone.mp3'),
//   Ringtone(ringtoneId: 2, ringtonePath: 'assets/ringtones/eminem.mp3'),
//   Ringtone(ringtoneId: 3, ringtonePath: 'assets/ringtones/fancy_like.mp3'),
//   Ringtone(ringtoneId: 4, ringtonePath: 'assets/ringtones/its_your_mother.mp3'),
//   Ringtone(ringtoneId: 5, ringtonePath: 'assets/ringtones/my_baby.mp3'),
//   Ringtone(ringtoneId: 6, ringtonePath: 'assets/ringtones/suga_boom_boom.mp3'),
//   Ringtone(
//       ringtoneId: 7, ringtonePath: 'assets/ringtones/welcome_to_my_home.mp3'),
// ];

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));

  return [
    if (duration.inHours > 0) hours,
    minutes,
    seconds,
  ].join(':');
}

class SelectRingtone extends StatefulWidget {
  int idRingtone;
  SelectRingtone({Key? key, required this.idRingtone}) : super(key: key);

  @override
  State<SelectRingtone> createState() => _SelectRingtoneState();
}

class _SelectRingtoneState extends State<SelectRingtone> {
  late DatabaseManagement database;
  List<Ringtone> ringtones = [];
  late int isChoice;

  void initState() {
    database = DatabaseManagement();
    getRingtones();
    isChoice = widget.idRingtone;
    super.initState();
  }

  void getRingtones() async {
    ringtones = await database.getRingtones();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    AudioCache audioCache = AudioCache();
    // AudioPlayer audioPlayer = AudioPlayer();
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
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: ringtones.length,
            itemBuilder: (BuildContext context, int index) {
              // AudioPlayer advancedPlayer = AudioPlayer();
              // String? localFilePath;
              // String? localAudioCacheURI;

              return GestureDetector(
                onTap: () async => {
                  setState(() {
                    isChoice = ringtones[index].ringtoneId!;
                    audioCache.clearAll();
                    audioCache.play(ringtones[index].ringtonePath);
                  }),
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black, width: 1.2)),
                    height: 70,
                    child: Row(
                      children: [
                        isChoice == ringtones[index].ringtoneId
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Icon(
                                  Icons.check_circle_rounded,
                                  size: 32,
                                  color: Colors.blueAccent,
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Icon(Icons.circle_outlined, size: 32),
                              ),
                        Text(
                          ringtones[index].getName(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: BottomButton(
        text: 'Save',
        onTap: () {
          Navigator.of(context).pop(isChoice);
        },
      ),
    );
  }
}
