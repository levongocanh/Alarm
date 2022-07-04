import 'package:alarm_app/models/alarm_mission.dart';
import 'package:alarm_app/models/repeat_days.dart';
import 'package:json_annotation/json_annotation.dart';

part 'alarm.g.dart';

@JsonSerializable()
class Alarm {
  static int currentAlarmId = -1;

  @JsonKey(name: 'alarm_id')
  int alarmId;

  @JsonKey(name: 'alarm_type')
  String alarmType;

  @JsonKey(name: 'is_active')
  bool? isActive;

  int? hour;
  int? minute;

  @JsonKey(name: 'ringtone_id')
  int ringtoneId;

  @JsonKey(name: 'alarm_volume')
  int alarmVolume;

  @JsonKey(name: 'alarm_label')
  String alarmLabel;
  bool vibrate;

  @JsonKey(name: 'repeat_days')
  RepeatDays repeatDays;

  @JsonKey(name: 'alarm_mission')
  AlarmMission alarmMission;

  Alarm(
      {required this.alarmId,
      required this.alarmType,
      required this.isActive,
      required this.hour,
      required this.minute,
      required this.ringtoneId,
      required this.alarmVolume,
      required this.alarmLabel,
      required this.vibrate,
      required this.repeatDays,
      required this.alarmMission});
      
  factory Alarm.fromJson(Map<String, dynamic> json) => _$AlarmFromJson(json);
  Map<String, dynamic> toJson() => _$AlarmToJson(this);
}
