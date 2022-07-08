import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// convert minutes difference between two DateTime to Date
String convert(durationInMinute) {
  return durationInMinute >= 60
      ? '${durationInMinute ~/ 60} giờ ${durationInMinute % 60} phút'
      : '$durationInMinute phút';
}

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
    switch (repeatDays) {
      case 'T2, T3, T4, T5, T6':
        return 'Các ngày trong tuần';
      case 'CN, T2, T3, T4, T5, T6, T7':
        return 'Hàng ngày';
      default:
        return repeatDays;
    }
  }

  String? getTimeLeft() {
    final now = DateTime.now();
    // convert [alarmHour] and [alarmMinute] to DateTime
    final alarmTime =
        DateTime(now.year, now.month, now.day, alarmHour, alarmMinute);

    var result = alarmTime.difference(now).inMinutes;
    // if [isNegative] = false => now > alarmTime => + 6 days
    // if [isNegative] = true => now < alarmTime => + 7 days

    int adding = result.isNegative ? 7 : 6;

    for (var i = 1; i <= adding; i++) {
      DateTime newTime = alarmTime.add(Duration(days: i));

      switch (newTime.weekday) {
        case 1: // monday
          return monday == 1 ? convert(newTime.difference(now).inMinutes) : '';
        case 2: // tuesday
          return tuesday == 1 ? convert(newTime.difference(now).inMinutes) : '';
        case 3: // wednesday
          return wednesday == 1 ? convert(newTime.difference(now).inMinutes) : '';
        case 4: // thursday
          return thursday == 1 ? convert(newTime.difference(now).inMinutes) : '';
        case 5: // friday
          return friday == 1 ? convert(newTime.difference(now).inMinutes) : '';
        case 6: // saturday
          return saturday == 1 ? convert(newTime.difference(now).inMinutes) : '';
        default: // sunday
          return sunday == 1 ? convert(newTime.difference(now).inMinutes) : '';
      }
    }
  }
}
