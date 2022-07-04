// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      photoId: json['photo_id'] as String,
      photoPath: json['photo_path'] as String,
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'photo_id': instance.photoId,
      'photo_path': instance.photoPath,
    };
