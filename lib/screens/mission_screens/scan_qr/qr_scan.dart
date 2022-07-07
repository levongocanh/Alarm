// ignore_for_file: prefer_const_constructors
import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/models/qr.dart';
import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';

// ignore: non_constant_identifier_names
var DUMMY_DATA = [
  QR(id: '1', qrCode: '157875687123'),
  QR(id: '2', qrCode: '157875687321'),
  QR(id: '3', qrCode: '157875687487'),
  QR(id: '4', qrCode: '157875687875'),
  QR(id: '5', qrCode: '157875687458'),
  QR(id: '6', qrCode: '157875687875'),
  QR(id: '7', qrCode: '157875687458'),
  QR(id: '8', qrCode: '157875687875'),
  QR(id: '9', qrCode: '157875687458'),
];
String isChoice = '';

class ScanQRMission extends StatefulWidget {
  Alarm alarm;
  ScanQRMission({Key? key, required this.alarm}) : super(key: key);

  @override
  State<ScanQRMission> createState() => _ScanQRMissionState();
}

class _ScanQRMissionState extends State<ScanQRMission> {
  String qrCode = 'Unknown';

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
        debugPrint(qrCode);
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    Alarm alarm = widget.alarm;
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
          'Quét QR',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'Select a QR code or barcode far from your bed',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'that you will scan to dismiss your alarm.',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              )
            ],
          ),
          // List code

          DUMMY_DATA.isEmpty == false
              ? Expanded(
                  child: Padding(
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
                              isChoice = DUMMY_DATA[index].id;
                            }),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: isChoice != DUMMY_DATA[index].id
                                        ? Colors.transparent
                                        : Colors.blue,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.black, width: 2)),
                                height: 80,
                                child: Center(
                                    child: Text(
                                  DUMMY_DATA[index].qrCode,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )),
                              ),
                            ),
                          );
                        }),
                  ),
                ))
              : Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'You haven\'t added any QR code yet',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                  ),
                ),

          // Add a code button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => {scanQRCode()},
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
                      Icon(
                        Icons.add,
                        size: 32,
                        color: Colors.black,
                      ),
                      Text(
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
          alarm.missionDiffcutly = null;
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
