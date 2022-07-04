import 'package:json_annotation/json_annotation.dart';

part 'alarm_history.g.dart';

@JsonSerializable()
class AlarmHistory {
  static int currentId = -1;
  int id;

  @JsonKey(name: 'alarm_date')
  String alarmDate;
  int hour;
  int minute;

  @JsonKey(name: 'mission_type')
  String missionType;

  AlarmHistory(
      {required this.id,
      required this.alarmDate,
      required this.hour,
      required this.minute,
      required this.missionType});

  factory AlarmHistory.fromJson(Map<String, dynamic> json) => _$AlarmHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$AlarmHistoryToJson(this);
}
