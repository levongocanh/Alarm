// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alarm _$AlarmFromJson(Map<String, dynamic> json) => Alarm(
      alarmId: json['alarm_id'] as int,
      alarmType: json['alarm_type'] as String,
      isActive: json['is_active'] as bool?,
      hour: json['hour'] as int?,
      minute: json['minute'] as int?,
      ringtoneId: json['ringtone_id'] as int,
      alarmVolume: json['alarm_volume'] as int,
      alarmLabel: json['alarm_label'] as String,
      vibrate: json['vibrate'] as bool,
      repeatDays:
          RepeatDays.fromJson(json['repeat_days'] as Map<String, dynamic>),
      alarmMission:
          AlarmMission.fromJson(json['alarm_mission'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AlarmToJson(Alarm instance) => <String, dynamic>{
      'alarm_id': instance.alarmId,
      'alarm_type': instance.alarmType,
      'is_active': instance.isActive,
      'hour': instance.hour,
      'minute': instance.minute,
      'ringtone_id': instance.ringtoneId,
      'alarm_volume': instance.alarmVolume,
      'alarm_label': instance.alarmLabel,
      'vibrate': instance.vibrate,
      'repeat_days': instance.repeatDays.toJson(),
      'alarm_mission': instance.alarmMission.toJson(),
    };
