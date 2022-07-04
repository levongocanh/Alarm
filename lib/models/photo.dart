import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo {
  static int currentId = -1;

  @JsonKey(name: 'photo_id')
  final String photoId;
  @JsonKey(name: 'photo_path')
  final String photoPath;

  Photo({required this.photoId, required this.photoPath});

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
