// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_mission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlarmMission _$AlarmMissionFromJson(Map<String, dynamic> json) => AlarmMission(
      missionType: json['mission_type'] as String,
      numberOfProblems: json['number_of_problems'] as int?,
      missionDifficulty: json['mission_difficulty'] as int?,
      codeId: json['code_id'] as String?,
      photoId: json['photo_id'] as String?,
    );

Map<String, dynamic> _$AlarmMissionToJson(AlarmMission instance) {
  final val = <String, dynamic>{
    'mission_type': instance.missionType,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('number_of_problems', instance.numberOfProblems);
  writeNotNull('mission_difficulty', instance.missionDifficulty);
  writeNotNull('code_id', instance.codeId);
  writeNotNull('photo_id', instance.photoId);
  return val;
}
