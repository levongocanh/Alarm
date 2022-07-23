// ignore_for_file: prefer_const_constructors
import 'package:alarm_app/models/database.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:alarm_app/models/ringtone.dart';
import 'package:alarm_app/widgets/bottom_button.dart';

// String formatTime(Duration duration) {
//   String twoDigits(int n) => n.toString().padLeft(2, '0');
//   final hours = twoDigits(duration.inHours);
//   final minutes = twoDigits(duration.inMinutes.remainder(60));
//   final seconds = twoDigits(duration.inSeconds.remainder(60));

//   return [
//     if (duration.inHours > 0) hours,
//     minutes,
//     seconds,
//   ].join(':');
// }

class SelectRingtone extends StatefulWidget {
  int idRingtone;
  SelectRingtone({Key? key, required this.idRingtone}) : super(key: key);

  @override
  State<SelectRingtone> createState() => _SelectRingtoneState();
}

class _SelectRingtoneState extends State<SelectRingtone> {
  late DatabaseManagement database;
  final audioPlayer = AudioPlayer();
  List<Ringtone> ringtones = [];
  late int isChoice;

  @override
  void initState() {
    database = DatabaseManagement();
    getRingtones();
    isChoice = widget.idRingtone;
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void getRingtones() async {
    ringtones = await database.getRingtones();
    setState(() {});
  }

  Future<void> playAudio(path) async {
    await audioPlayer.pause();
    // loop the ringtone when it completed
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    var file = await AudioCache().load(path);
    debugPrint(file.path);
    await audioPlayer.play(file.path, isLocal: true,);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.navigate_before, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(isChoice),
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
                return GestureDetector(
                  onTap: () async {
                    setState(() {
                      isChoice = ringtones[index].ringtoneId!;
                    });
                    debugPrint(isChoice.toString());
                    playAudio(ringtones[index].ringtonePath);
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Icon(
                                    Icons.check_circle_rounded,
                                    size: 32,
                                    color: Colors.blueAccent,
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
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
      ),
    );
  }
}
