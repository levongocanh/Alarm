import 'package:alarm_app/models/barcode_qrcode.dart';
import 'package:alarm_app/models/database.dart';
import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class DismissQRcode extends StatefulWidget {
  final int idQRcode;
  const DismissQRcode({Key? key, required this.idQRcode}) : super(key: key);

  @override
  State<DismissQRcode> createState() => _DismissQRcodeState();
}

class _DismissQRcodeState extends State<DismissQRcode> {
  late DatabaseManagement database;
  String qrCode = '';
  List<BarcodeQRcode> barcodeQRcodes = [];
  @override
  void initState() {
    database = DatabaseManagement();
    getBarcodeQRcode();
    super.initState();
  }

  void getBarcodeQRcode() async {
    barcodeQRcodes = await database.getBarcodeQRcode();
    setState(() {});
  }

  BarcodeQRcode findQRCode(int id) =>
      barcodeQRcodes.firstWhere((i) => i.barcodeQRcodeId == id);

  Future<void> scanQRCode(String selectedQR) async {
    try {
      final qrCodeScan = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      if (qrCodeScan == selectedQR) {
        AlertDialog(
          title: const Text('Bạn đã tắt báo thức thành công'),
          actions: [
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
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
        );
      } else {
        AlertDialog(
            title: const Text('Bạn chưa tắt báo thức thành công'),
            actions: [
              MaterialButton(
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.of(context).pop('OK');
                },
                child: const Text('OK'),
              ),
            ]);
      }
    } on PlatformException {
      selectedQR = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (barcodeQRcodes.isNotEmpty) {
      qrCode = findQRCode(widget.idQRcode).code;
    }
    return WillPopScope(
      // disable back button
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.navigate_before, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: const Text(
            'Nhiệm vụ quét QR',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.qr_code_scanner,
                size: 84,
              ),
              Text(qrCode,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w500)),
            ],
          ),
        )),
        bottomNavigationBar: BottomButton(
          text: 'Scan QR code',
          onTap: () => scanQRCode(qrCode),
        ),
      ),
    );
  }
}
