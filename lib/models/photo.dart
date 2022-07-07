class Photo {
  int? photoId;
  String photoPath;

  Photo({
    this.photoId,
    required this.photoPath,
  });

  Map<String, dynamic> toMap() => {
        'photoId': photoId,
        'photoPath': photoPath,
      };

  factory Photo.fromMap(Map<String, dynamic> json) =>
      Photo(photoId: json['photoId'], photoPath: json["photoPath"]);

  @override
  String toString() {
    return 'Photo{photoId: $photoId, photoPath: $photoPath}';
  }
}
