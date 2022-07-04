// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppData _$AppDataFromJson(Map<String, dynamic> json) => AppData(
      alarms: (json['alarms'] as List<dynamic>?)
          ?.map((e) => Alarm.fromJson(e as Map<String, dynamic>))
          .toList(),
      alarmHistory: (json['alarm_history'] as List<dynamic>?)
          ?.map((e) => AlarmHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      settings: json['settings'] == null
          ? null
          : Setting.fromJson(json['settings'] as Map<String, dynamic>),
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      qRcodeBarcode: (json['qrcode_barcode'] as List<dynamic>?)
          ?.map((e) => QRcodeBarcode.fromJson(e as Map<String, dynamic>))
          .toList(),
      ringtones: (json['ringtones'] as List<dynamic>?)
          ?.map((e) => Ringtone.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppDataToJson(AppData instance) => <String, dynamic>{
      'alarms': instance.alarms,
      'alarm_history': instance.alarmHistory,
      'settings': instance.settings,
      'photos': instance.photos,
      'qrcode_barcode': instance.qRcodeBarcode,
      'ringtones': instance.ringtones,
    };
