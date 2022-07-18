import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:flutter/material.dart';

class ScanQRMission extends StatefulWidget {
  Alarm alarm;
  ScanQRMission({Key? key, required this.alarm}) : super(key: key);

  @override
  State<ScanQRMission> createState() => _ScanQRMissionState();
}

class _ScanQRMissionState extends State<ScanQRMission> {
  @override
  Widget build(BuildContext context) {
    Alarm alarm = widget.alarm;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          // App bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.navigate_before,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.black,
                  )),
            ],
          ),
          // Text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Mã vạch/Mã QR',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Text(
                    'Select a QR code or barcode far from your bed',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                  const Text(
                    'that you will scan to dismiss your alarm.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                ],
              )
            ],
          ),
          // List code

          // Add a code button
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => debugPrint('Add photo'),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white, width: 1)),
                height: 72,
                width: 320,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(
                        Icons.add,
                        size: 32,
                        color: Colors.black,
                      ),
                      const Text(
                        'Add a code',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
      bottomNavigationBar: BottomButton(
        text: 'Save',
        onTap: () {
          alarm.alarmMissionType = 'scanning';
          alarm.missionDifficulty = null;
          alarm.numberOfProblems = null;
          alarm.barcodeQRcodeId = 1; // replace with selected bar code id
          alarm.photoId = null;

          Navigator.of(context)
            ..pop()
            ..pop();
          debugPrint('Selected QR Scan Mission');
        },
      ),
    );
  }
}
