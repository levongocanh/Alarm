import 'package:alarm_app/models/alarm.dart';
import 'package:alarm_app/widgets/bottom_button.dart';
import 'package:flutter/material.dart';

import '../../../models/photo.dart';

// ignore: non_constant_identifier_names
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

var isChoice = 0;

class TakePhotoMission extends StatefulWidget {
  Alarm alarm;
  TakePhotoMission({Key? key, required this.alarm}) : super(key: key);

  @override
  State<TakePhotoMission> createState() => _TakePhotoMissionState();
}

class _TakePhotoMissionState extends State<TakePhotoMission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Chụp ảnh',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          // Text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: const [
                    Text(
                      'Select a spot far from your bed',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'you will snap to dismiss your alarm.',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      '(The kitchen or bathroom works great!)',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              )
            ],
          ),
          // List Photo
          DUMMY_DATA.isEmpty == false
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black, width: 1)),
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: DUMMY_DATA.length,
                          padding: const EdgeInsets.all(8),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => setState(() {
                                isChoice = DUMMY_DATA[index].photoId!;
                              }),
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          DUMMY_DATA[index].photoPath),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: isChoice == DUMMY_DATA[index].photoId
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.blue,
                                        size: 80,
                                      )
                                    : null,
                              ),
                            );
                          }),
                    ),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'You haven\'t added any photos yet',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
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
                    children: const [
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
