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
}
