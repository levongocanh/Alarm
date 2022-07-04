// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Setting _$SettingFromJson(Map<String, dynamic> json) => Setting(
      theme: json['theme'] as String,
      missionDuration: json['mission_duration'] as int? ?? 120,
      language: json['language'] as String? ?? 'vi',
      muteDuringMission: json['mute_during_mission'] as bool? ?? true,
    );

Map<String, dynamic> _$SettingToJson(Setting instance) => <String, dynamic>{
      'theme': instance.theme,
      'mission_duration': instance.missionDuration,
      'language': instance.language,
      'mute_during_mission': instance.muteDuringMission,
    };
