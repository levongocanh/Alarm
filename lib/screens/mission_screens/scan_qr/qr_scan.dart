import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/models/barcode_qrcode.dart';
import 'package:alarm_app/models/database.dart';
import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';

class ScanQRMission extends StatefulWidget {
  Alarm alarm;
  ScanQRMission({Key? key, required this.alarm}) : super(key: key);

  @override
  State<ScanQRMission> createState() => _ScanQRMissionState();
}

class _ScanQRMissionState extends State<ScanQRMission> {
  late DatabaseManagement database;
  List<BarcodeQRcode> barcodeQRcodes = [];
  int? isChoice;
  late Alarm alarm;
  String qrCode = 'Unknown';

  @override
  void initState() {
    database = DatabaseManagement();
    getBarcodeQRcode();
    alarm = widget.alarm;
    isChoice = alarm.barcodeQRcodeId;

    super.initState();
  }

  void getBarcodeQRcode() async {
    barcodeQRcodes = await database.getBarcodeQRcode();
    setState(() {});
  }

  Future<String?> openEditQRcode(int id) async => showDialog<String?>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Bạn có muốn xóa QR code này ?'),
          actions: [
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                database.deleteBarcodeQRcode(id);
                Navigator.of(context).pop('OK');
              },
              child: const Text('OK'),
            ),

            // This cancel button will be re-opened when I found a way to return the old text
            MaterialButton(
              color: Colors.blueGrey,
              onPressed: () {
                Navigator.of(context).pop('Cancel');
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      );

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      this.qrCode = qrCode;
      if (qrCode != '-1') {
        database.insertBarcodeQRcode(BarcodeQRcode(code: qrCode));
        debugPrint(BarcodeQRcode(code: qrCode).toString());
      }
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
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
                  children: const [
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

          barcodeQRcodes.isEmpty == false
              ? Expanded(
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      padding: const EdgeInsets.all(4),
                      itemCount: barcodeQRcodes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () => setState(() {
                            isChoice = barcodeQRcodes[index].barcodeQRcodeId!;
                          }),
                          onLongPress: () async {
                            var res = await openEditQRcode(
                                barcodeQRcodes[index].barcodeQRcodeId!);
                            getBarcodeQRcode();
                            if (res == 'OK') {
                              setState(() {
                                isChoice = barcodeQRcodes[0].barcodeQRcodeId!;
                              });
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              height: 60,
                              child: Row(
                                children: [
                                  isChoice ==
                                          barcodeQRcodes[index].barcodeQRcodeId
                                      ? const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: Icon(
                                            Icons.check_circle,
                                            size: 28,
                                            color: Colors.blueAccent,
                                          ),
                                        )
                                      : const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: Icon(
                                            Icons.circle_outlined,
                                            size: 28,
                                            color: Colors.black,
                                          ),
                                        ),
                                  Center(
                                      child: Text(
                                    barcodeQRcodes[index].code,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ))
              : const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'You haven\'t added any QR code yet',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                  ),
                ),

          // Add a code button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                await scanQRCode();
                getBarcodeQRcode();
              },
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
          if (isChoice != null) {
            alarm.alarmMissionType = 'scanning';
            alarm.missionDifficulty = null;
            alarm.numberOfProblems = null;
            alarm.barcodeQRcodeId =
                isChoice; // replace with selected bar code id
            alarm.photoId = null;

            Navigator.of(context)
              ..pop()
              ..pop();
            debugPrint('Selected QR Scan Mission');
          } else {
            debugPrint('Please select the code');
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}
