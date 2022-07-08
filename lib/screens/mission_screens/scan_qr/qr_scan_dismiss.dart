import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../../models/barcode_qrcode.dart';
import '../../../models/database.dart';

class DismissQRcode extends StatefulWidget {
  int idQRcode;
  DismissQRcode({Key? key, required this.idQRcode}) : super(key: key);

  @override
  State<DismissQRcode> createState() => _DismissQRcodeState();
}

class _DismissQRcodeState extends State<DismissQRcode> {
  late DatabaseManagement database;
  List<BarcodeQRcode> barcodeQRcodes = [];
  @override
  void initState() {
    database = DatabaseManagement();
    getBarcodeQRcode();
    // qrCode = findQRCode(widget.idQRcode).code;
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
        print(qrCodeScan == selectedQR);
        Navigator.of(context).pop();
      } else {}
    } on PlatformException {
      selectedQR = 'Failed to get platform version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    String qrCode = findQRCode(widget.idQRcode).code;

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
          'Nhiệm vụ quét QR',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            Icon(
              Icons.qr_code_scanner,
              size: 84,
            ),
            Text(qrCode,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
          ],
        ),
      )),
      bottomNavigationBar: BottomButton(
        text: 'Scan QR code',
        onTap: () => scanQRCode(qrCode),
      ),
    );
  }
}
