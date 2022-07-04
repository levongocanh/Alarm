import 'package:json_annotation/json_annotation.dart';

part 'ringtone.g.dart';

@JsonSerializable()
class Ringtone {
  static int currentId = -1;

  @JsonKey(name: 'ringtone_id')
  final int ringtoneId;
  
  @JsonKey(name: 'ringtone_path')
  final String ringtonePath;
  
  Ringtone({required this.ringtoneId, required this.ringtonePath});

  factory Ringtone.fromJson(Map<String, dynamic> json) => _$RingtoneFromJson(json);
  Map<String, dynamic> toJson() => _$RingtoneToJson(this);
}
