// ignore_for_file: prefer_const_constructors

import 'package:alarm_app/models/photo.dart';
import 'package:alarm_app/screens/mission_screens/take_photo/photo_item.dart';
import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:flutter/material.dart';

final DUMMY_DATA = [
  Photo(photoId: 1, photoPath: 'assets/photos/photo1.jpg'),
  Photo(photoId: 2, photoPath: 'assets/photos/photo2.jpg'),
  Photo(photoId: 3, photoPath: 'assets/photos/photo3.jpg'),
  Photo(photoId: 4, photoPath: 'assets/photos/photo1.jpg'),
  Photo(photoId: 5, photoPath: 'assets/photos/photo2.jpg'),
  Photo(photoId: 6, photoPath: 'assets/photos/photo3.jpg'),
  Photo(photoId: 7, photoPath: 'assets/photos/photo1.jpg'),
  Photo(photoId: 8, photoPath: 'assets/photos/photo2.jpg'),
];

class TakePhotoMission extends StatefulWidget {
  const TakePhotoMission({Key? key}) : super(key: key);

  @override
  State<TakePhotoMission> createState() => _TakePhotoMissionState();
}

class _TakePhotoMissionState extends State<TakePhotoMission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          // App bar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.navigate_before,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.black,
                  )),
            ],
          ),
          // Text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Chụp ảnh',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    'Select a spot far from your bed',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    'you will snap to dismiss your alarm.',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    '(The kitchen or bathroom works great!)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ],
              )
            ],
          ),
          // List Photo
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              padding: EdgeInsets.all(8),
              children: DUMMY_DATA
                  .map(
                      (item) => PhotoItem(id: item.photoId!, dirPhoto: item.photoPath))
                  .toList(),
            ),
          ),
          // Add Photo Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => debugPrint('Add photo'),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white, width: 1)),
                height: 72,
                width: 320,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(
                        Icons.add,
                        size: 32,
                        color: Colors.black,
                      ),
                      Text(
                        'Add a photo',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
      //Bottom Save Button
      bottomNavigationBar: BottomButton(
        text: 'Save',
        onTap: () {
          Navigator.of(context).pop();
          debugPrint('Selected Take Photo Mission');
        },
      ),
    );
  }
}