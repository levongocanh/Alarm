import 'package:json_annotation/json_annotation.dart';

part 'repeat_days.g.dart';

@JsonSerializable()
class RepeatDays {
  bool sunday;
  bool monday;
  bool tuesday;
  bool wednesday;
  bool thursday;
  bool friday;
  bool saturday;

  RepeatDays({
      required this.sunday,
      required this.monday,
      required this.tuesday,
      required this.wednesday,
      required this.thursday,
      required this.friday,
      required this.saturday
    });

  factory RepeatDays.fromJson(Map<String, dynamic> json) => _$RepeatDaysFromJson(json);
  Map<String, dynamic> toJson() => _$RepeatDaysToJson(this);
}
