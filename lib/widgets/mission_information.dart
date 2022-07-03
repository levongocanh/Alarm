import 'package:flutter/material.dart';

class MissionInformation extends StatelessWidget {
  final String missionName;
  final double missionNameSize;
  final String missionDescription;
  final double missionDescriptionSize;

  MissionInformation({
    required this.missionName,
    this.missionNameSize = 35,
    required this.missionDescription,
    this.missionDescriptionSize = 22,
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
