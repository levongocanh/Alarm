import 'package:flutter/material.dart';

class MissionInformation extends StatelessWidget {
  String missionName;
  double missionNameSize;
  String missionDescription;
  double missionDescriptionSize;

  MissionInformation({
    required this.missionName,
    this.missionNameSize = 35,
    required this.missionDescription,
    this.missionDescriptionSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Text(
            missionName,
            softWrap: true,
            style: TextStyle(
              fontSize: missionNameSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            missionDescription,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: missionDescriptionSize,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
