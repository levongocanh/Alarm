import 'package:json_annotation/json_annotation.dart';

part 'alarm_mission.g.dart';

@JsonSerializable()
class AlarmMission {
  @JsonKey(name: 'mission_type')
  String missionType;

  @JsonKey(name: 'number_of_problems', includeIfNull: false)
  int? numberOfProblems;

  @JsonKey(name: 'mission_difficulty', includeIfNull: false)
  int? missionDifficulty;

  @JsonKey(name: 'code_id', includeIfNull: false)
  String? codeId;

  @JsonKey(name: 'photo_id', includeIfNull: false)
  String? photoId;

  AlarmMission(
      {required this.missionType,
      this.numberOfProblems,
      this.missionDifficulty,
      this.codeId,
      this.photoId});

  factory AlarmMission.fromJson(Map<String, dynamic> json) =>  _$AlarmMissionFromJson(json);
  Map<String, dynamic> toJson() => _$AlarmMissionToJson(this);
}
