class BarcodeQRcode {
  int? barcodeQRcodeId;
  String code;

  BarcodeQRcode({
    this.barcodeQRcodeId,
    required this.code,
  });

  Map<String, dynamic> toMap() => {
        'barcodeQRcodeId': barcodeQRcodeId,
        'code': code,
      };

  factory BarcodeQRcode.fromMap(Map<String, dynamic> json) => BarcodeQRcode(
      barcodeQRcodeId: json['barcodeQRcodeId'], code: json["code"]);

  @override
  String toString() {
    return 'BarcodeQRcode{barcodeQRcodeId: $barcodeQRcodeId, code: $code}';
  }
}
