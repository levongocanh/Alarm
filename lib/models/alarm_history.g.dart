// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlarmHistory _$AlarmHistoryFromJson(Map<String, dynamic> json) => AlarmHistory(
      id: json['id'] as int,
      alarmDate: json['alarm_date'] as String,
      hour: json['hour'] as int,
      minute: json['minute'] as int,
      missionType: json['mission_type'] as String,
    );

Map<String, dynamic> _$AlarmHistoryToJson(AlarmHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'alarm_date': instance.alarmDate,
      'hour': instance.hour,
      'minute': instance.minute,
      'mission_type': instance.missionType,
    };
