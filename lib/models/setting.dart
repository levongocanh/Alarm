import 'package:json_annotation/json_annotation.dart';
part 'setting.g.dart';

@JsonSerializable()
class Setting {
  String theme;

  @JsonKey(name: 'mission_duration', defaultValue: 120)
  int? missionDuration;

  @JsonKey(defaultValue: 'vi')
  String language;

  @JsonKey(name: 'mute_during_mission', defaultValue: true)
  bool muteDuringMission;

  Setting(
      {required this.theme,
      required this.missionDuration,
      required this.language,
      required this.muteDuringMission});

  factory Setting.fromJson(Map<String, dynamic> json) => _$SettingFromJson(json);
  Map<String, dynamic> toJson() => _$SettingToJson(this);
}