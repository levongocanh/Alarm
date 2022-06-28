import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  final String id;
  final String dirPhoto;

  const PhotoItem({Key? key, required this.id, required this.dirPhoto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(dirPhoto),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 1)),
    );
  }
}
