import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Alarm {
  int? alarmId;
  int isActive;
  String alarmType;
  int alarmHour;
  int alarmMinute;
  int alarmRingtoneId;
  int alarmVolume;
  String alarmLabel;
  int alarmVibrate;

  int sunday;
  int monday;
  int tuesday;
  int wednesday;
  int thursday;
  int friday;
  int saturday;

  String alarmMissionType;
  int? missionDiffcutly;
  int? numberOfProblems;
  int? barcodeQRcodeId;
  int? photoId;

  Alarm({
    this.alarmId,
    required this.isActive,
    required this.alarmType,
    required this.alarmHour,
    required this.alarmMinute,
    required this.alarmRingtoneId,
    required this.alarmVolume,
    required this.alarmLabel,
    required this.alarmVibrate,
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.alarmMissionType,
    this.missionDiffcutly,
    this.numberOfProblems,
    this.barcodeQRcodeId,
    this.photoId,
  });

  Map<String, dynamic> toMap() => {
        'alarmId': alarmId,
        'isActive': isActive,
        'alarmType': alarmType,
        'alarmHour': alarmHour,
        'alarmMinute': alarmMinute,
        'alarmRingtoneId': alarmRingtoneId,
        'alarmVolume': alarmVolume,
        'alarmLabel': alarmLabel,
        'alarmVibrate': alarmVibrate,
        'sunday': sunday,
        'monday': monday,
        'tuesday': tuesday,
        'wednesday': wednesday,
        'thursday': thursday,
        'friday': friday,
        'saturday': saturday,
        'alarmMissionType': alarmMissionType,
        'missionDiffcutly': missionDiffcutly,
        'numberOfProblems': numberOfProblems,
        'barcodeQRcodeId': barcodeQRcodeId,
        'photoId': photoId,
      };

  factory Alarm.fromMap(Map<String, dynamic> json) => Alarm(
        alarmId: json['alarmId'],
        isActive: json['isActive'],
        alarmType: json['alarmType'],
        alarmHour: json['alarmHour'],
        alarmMinute: json['alarmMinute'],
        alarmRingtoneId: json['alarmRingtoneId'],
        alarmVolume: json['alarmVolume'],
        alarmLabel: json['alarmLabel'],
        alarmVibrate: json['alarmVibrate'],
        sunday: json['sunday'],
        monday: json['monday'],
        tuesday: json['tuesday'],
        wednesday: json['wednesday'],
        thursday: json['thursday'],
        friday: json['friday'],
        saturday: json['saturday'],
        alarmMissionType: json['alarmMissionType'],
        missionDiffcutly: json['missionDiffcutly'],
        numberOfProblems: json['numberOfProblems'],
        barcodeQRcodeId: json['barcodeQRcodeId'],
        photoId: json['photoId'],
      );

  @override
  String toString() {
    return 'Alarm{ alarmId: $alarmId, isActive: $isActive, alarmType: $alarmType, alarmHour: $alarmHour, alarmMinute: $alarmMinute, alarmRingtoneId: $alarmRingtoneId, alarmVolume: $alarmVolume, alarmLabel: $alarmLabel, alarmVibrate: $alarmVibrate, sunday: $sunday, monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday, saturday: $saturday, alarmMissionType: $alarmMissionType, missionDiffcutly: $missionDiffcutly, barcodeQRcodeId: $barcodeQRcodeId, photoId: $photoId}';
  }

  String getDisplayTime() {
    return DateFormat.Hm()
        .format(DateFormat.Hm().parse('$alarmHour:$alarmMinute'));
  }

  Icon getDisplayMission() {
    if (alarmType == 'fast') {
      return const Icon(Icons.bolt);
    } else {
      switch (alarmMissionType) {
        case 'math':
          return const Icon(Icons.calculate);
        case 'typing':
          return const Icon(Icons.keyboard);
        case 'photo':
          return const Icon(Icons.photo_camera);
        case 'step':
          return const Icon(Icons.directions_run);
        case 'scanning':
          return const Icon(Icons.qr_code_scanner);
        default:
          return const Icon(Icons.alarm);
      }
    }
  }

  String getMissionDisplayName() {
    switch (alarmMissionType) {
      case 'math':
        return 'Giải toán';
      case 'typing':
        return 'Typing';
      case 'photo':
        return 'Chụp ảnh';
      case 'step':
        return 'Step';
      case 'scanning':
        return 'Mã vạch/mã QR';
      default:
        return 'Mặc định';
    }
  }

  String getRepeatDisplay() {
    var repeatDays = '';
    if (sunday == 1) {
      repeatDays = repeatDays == '' ? 'CN' : '$repeatDays, CN';
    }
    if (monday == 1) {
      repeatDays = repeatDays == '' ? 'T2' : '$repeatDays, T2';
    }
    if (tuesday == 1) {
      repeatDays = repeatDays == '' ? 'T3' : '$repeatDays, T3';
    }
    if (wednesday == 1) {
      repeatDays = repeatDays == '' ? 'T4' : '$repeatDays, T4';
    }
    if (thursday == 1) {
      repeatDays = repeatDays == '' ? 'T5' : '$repeatDays, T5';
    }
    if (friday == 1) {
      repeatDays = repeatDays == '' ? 'T6' : '$repeatDays, T6';
    }
    if (saturday == 1) {
      repeatDays = repeatDays == '' ? 'T7' : '$repeatDays, T7';
    }
    return repeatDays;
  }

  // result is an integer - minute
  int getTimeLeft() {
    return 0;
  }
}
