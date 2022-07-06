class AlarmHistory {
  int? alarmHistoryId;
  String alarmHistoryDate;
  String alarmHistoryTime;
  String alarmHistoryMissionType;

  AlarmHistory(
      {this.alarmHistoryId,
      required this.alarmHistoryDate,
      required this.alarmHistoryTime,
      required this.alarmHistoryMissionType});

  Map<String, dynamic> toMap() => {
        'alarmHistoryId': alarmHistoryId,
        'alarmHistoryDate': alarmHistoryDate,
        'alarmHistoryTime': alarmHistoryTime,
        'alarmHistoryMissionType': alarmHistoryMissionType,
      };

  factory AlarmHistory.fromMap(Map<String, dynamic> json) => AlarmHistory(
        alarmHistoryId: json['alarmHistoryId'],
        alarmHistoryDate: json["alarmHistoryDate"],
        alarmHistoryTime: json["alarmHistoryTime"],
        alarmHistoryMissionType: json["alarmHistoryMissionType"],
      );

  @override
  String toString() {
    return 'AlarmHistory{alarmHistoryId: $alarmHistoryId, alarmHistoryDate: $alarmHistoryDate, alarmHistoryTime: $alarmHistoryTime, alarmHistoryMissionType: $alarmHistoryMissionType}';
  }
}
