import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/models/alarm_history.dart';
import 'package:alarm_app/models/photo.dart';
import 'package:alarm_app/models/qrcode_barcode.dart';
import 'package:alarm_app/models/ringtone.dart';
import 'package:alarm_app/models/setting.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_data.g.dart';

@JsonSerializable(explicitToJson: true)
class AppData {
  List<Alarm>? alarms;

  @JsonKey(name: 'alarm_history')
  List<AlarmHistory>? alarmHistory;
  Setting? settings;
  List<Photo>? photos;

  @JsonKey(name: 'qrcode_barcode')
  List<QRcodeBarcode>? qRcodeBarcode;
  List<Ringtone>? ringtones;

  AppData(
      {this.alarms,
      this.alarmHistory,
      this.settings,
      this.photos,
      this.qRcodeBarcode,
      this.ringtones});

  factory AppData.fromJson(Map<String, dynamic> json) => _$AppDataFromJson(json);
  Map<String, dynamic> toJson() => _$AppDataToJson(this);
}
