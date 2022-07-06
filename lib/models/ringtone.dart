class Ringtone {
  int? ringtoneId;
  String ringtonePath;

  Ringtone({
    this.ringtoneId,
    required this.ringtonePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'ringtoneId': ringtoneId,
      'ringtonePath': ringtonePath,
    };
  }

  factory Ringtone.fromMap(Map<String, dynamic> json) => Ringtone(
      ringtoneId: json['ringtoneId'], ringtonePath: json["ringtonePath"]);

  String getName() {
    String name = ringtonePath.split('/')[2];
    name = name.split('.')[0];
    name = name.replaceAll('_', ' ');
    return name;
  }

  @override
  String toString() {
    return 'Ringtone{ringtoneId: $ringtoneId, photoPath: $ringtonePath}';
  }
}
