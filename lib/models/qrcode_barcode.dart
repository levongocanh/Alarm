import 'package:json_annotation/json_annotation.dart';

part 'qrcode_barcode.g.dart';

@JsonSerializable()
class QRcodeBarcode{
  static int currentQRcodeBarcodeId = -1;

  @JsonKey(name: 'code_id')
  final int codeId;
  
  final String code;
  
  QRcodeBarcode({required this.codeId, required this.code});

  factory QRcodeBarcode.fromJson(Map<String, dynamic> json) => _$QRcodeBarcodeFromJson(json);
  Map<String, dynamic> toJson() => _$QRcodeBarcodeToJson(this);
}
