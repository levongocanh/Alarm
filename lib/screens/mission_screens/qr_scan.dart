// ignore_for_file: prefer_const_constructors

import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:alarm_app/widgets/mission_information.dart';
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
      body: Container(
        margin: EdgeInsetsDirectional.only(start: 15, end: 15, top: 15),
        child: ListView(
          children: <Widget>[
            MissionInformation(
              missionName: 'Mã vạch/mã QR',
              missionNameSize: 35,
              missionDescription:
                  'Select a QR code or barcode far from your bed that you will scan to dismiss your alarm.',
              missionDescriptionSize: 20,
            ),
            // Thêm mấy cái widgets ở đây
          ],
        ),
      ),
      bottomNavigationBar: BottomButton(
        text: 'Save',
        onTap: () {
          Navigator.of(context).pop();
          debugPrint('Selected QR Scan Mission');
        },
      ),
    );
  }
}
