class Setting {
  int? settingId;
  String appTheme;
  int muteDuringMission;
  String appLanguage;
  int speakerAlways;
  int ascendingAlarmVolume;

  Setting({
    this.settingId,
    required this.appTheme,
    required this.muteDuringMission,
    required this.appLanguage,
    required this.speakerAlways,
    required this.ascendingAlarmVolume,
  });

  Map<String, dynamic> toMap() => {
        'settingId': settingId,
        'appTheme': appTheme,
        'muteDuringMission': muteDuringMission,
        'appLanguage': appLanguage,
        'speakerAlways': speakerAlways,
        'ascendingAlarmVolume': ascendingAlarmVolume,
      };

  factory Setting.fromMap(Map<String, dynamic> json) => Setting(
      settingId: json['settingId'],
      appTheme: json["appTheme"],
      muteDuringMission: json["muteDuringMission"],
      appLanguage: json["appLanguage"],
      speakerAlways: json["speakerAlways"],
      ascendingAlarmVolume: json["ascendingAlarmVolume"]);

  @override
  String toString() {
    return 'Setting{settingId: $settingId, appTheme: $appTheme, muteDuringMission: $muteDuringMission, appLanguage: $appLanguage, speakerAlways: $speakerAlways, ascendingAlarmVolume: $ascendingAlarmVolume}';
  }
}
