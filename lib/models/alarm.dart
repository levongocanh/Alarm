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
  int? missionDifficulty;
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
    this.missionDifficulty,
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
        'missionDifficulty': missionDifficulty,
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
        missionDifficulty: json['missionDifficulty'],
        numberOfProblems: json['numberOfProblems'],
        barcodeQRcodeId: json['barcodeQRcodeId'],
        photoId: json['photoId'],
      );

  @override
  String toString() {
    return 'Alarm{ alarmId: $alarmId, isActive: $isActive, alarmType: $alarmType, alarmHour: $alarmHour, alarmMinute: $alarmMinute, alarmRingtoneId: $alarmRingtoneId, alarmVolume: $alarmVolume, alarmLabel: $alarmLabel, alarmVibrate: $alarmVibrate, sunday: $sunday, monday: $monday, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday, saturday: $saturday, alarmMissionType: $alarmMissionType, missionDifficulty: $missionDifficulty, barcodeQRcodeId: $barcodeQRcodeId, photoId: $photoId}';
  }

  String getDisplayTime() {
    return DateFormat.Hm()
        .format(DateFormat.Hm().parse('$alarmHour:$alarmMinute'));
  }

  Icon getDisplayMission() {
    if (alarmType == 'quick') {
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
      case 'shake':
        return 'Lắc điện thoại';
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

  int getTimeLeftInMinutes() {
    final now = DateTime.now();
    // convert [alarmHour] and [alarmMinute] to DateTime
    final alarmTime =
        DateTime(now.year, now.month, now.day, alarmHour, alarmMinute);

    var result = alarmTime.difference(now).inMinutes;

    // no [repeatWeekDays] selected this will calculated for the next day
    if (friday == 0 &&
        monday == 0 &&
        tuesday == 0 &&
        wednesday == 0 &&
        thursday == 0 &&
        friday == 0 &&
        saturday == 0) {
      return result.isNegative
          ? alarmTime.add(const Duration(days: 1)).difference(now).inMinutes
          : result;
    }

    // add 8 days
    for (var i = result.isNegative ? 0 : 1; i <= 8; i++) {
      DateTime newTime = alarmTime.add(Duration(days: i));
      var differenceInMinutes = newTime.difference(now).inMinutes;

      switch (newTime.weekday) {
        case 1: // monday
          if (monday == 1 && !differenceInMinutes.isNegative) {
            return differenceInMinutes;
          }
          break;
        case 2: // tuesday
          if (tuesday == 1 && !differenceInMinutes.isNegative) {
            return differenceInMinutes;
          }
          break;
        case 3: // wednesday
          if (wednesday == 1 && !differenceInMinutes.isNegative) {
            return differenceInMinutes;
          }
          break;
        case 4: // thursday
          if (thursday == 1 && !differenceInMinutes.isNegative) {
            return differenceInMinutes;
          }
          break;
        case 5: // friday
          if (friday == 1 && !differenceInMinutes.isNegative) {
            return differenceInMinutes;
          }
          break;
        case 6: // saturday
          if (saturday == 1 && !differenceInMinutes.isNegative) {
            return differenceInMinutes;
          }
          break;
        default: // sunday
          if (sunday == 1 && !differenceInMinutes.isNegative) {
            return differenceInMinutes;
          }
          break;
      }
    }
    return -1;
  }

  // convert minutes difference between two DateTime in Minutes to date in String
  String getTimeLeftInString() {
    return convertTimeLeftToString(getTimeLeftInMinutes());
  }
}

String convertTimeLeftToString(durationInMinutes) {
  if (durationInMinutes <= 1) {
    return 'dưới 1 phút';
  }
  var days = durationInMinutes ~/ 1440;
  durationInMinutes -= days * 1440;
  var hours = durationInMinutes ~/ 60;
  durationInMinutes -= hours * 60;
  var minutes = durationInMinutes % 60;
  var stringDays = days > 0 ? '$days ngày' : '';
  var stringHours = hours > 0 ? '$hours giờ' : '';
  var stringMinutes = '$minutes phút';
  return '$stringDays $stringHours $stringMinutes'.trim();
}
