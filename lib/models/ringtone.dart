class Ringtone {
  int? ringtoneId;
  String ringtonePath;

  Ringtone({
    this.ringtoneId,
    required this.ringtonePath,
  });

  Map<String, dynamic> toMap() => {
        'ringtoneId': ringtoneId,
        'ringtonePath': ringtonePath,
      };

  factory Ringtone.fromMap(Map<String, dynamic> json) => Ringtone(
      ringtoneId: json['ringtoneId'], ringtonePath: json["ringtonePath"]);

  String getName() {
    return ringtonePath.split('/')[-1];
  }

  @override
  String toString() {
    return 'Ringtone{ringtoneId: $ringtoneId, photoPath: $ringtonePath}';
  }
}
