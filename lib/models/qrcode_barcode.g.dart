// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qrcode_barcode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QRcodeBarcode _$QRcodeBarcodeFromJson(Map<String, dynamic> json) =>
    QRcodeBarcode(
      codeId: json['code_id'] as int,
      code: json['code'] as String,
    );

Map<String, dynamic> _$QRcodeBarcodeToJson(QRcodeBarcode instance) =>
    <String, dynamic>{
      'code_id': instance.codeId,
      'code': instance.code,
    };
