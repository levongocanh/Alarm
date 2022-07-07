import 'package:flutter/material.dart';

class SelectMissionButton extends StatelessWidget {
  final double height;
  final double margin;
  final double borderRadius;
  final Color? color;
  final VoidCallback onTap;
  final Icon missionIcon;
  final String missionName;
  final String missionInformation;
  final double iconWidth;
  final double missionNameFontSize;
  final double missionInformationFontSize;
  final bool onSelected;

  const SelectMissionButton({
    this.height = 70,
    this.margin = 5,
    this.borderRadius = 8,
    this.color = Colors.grey,
    required this.onTap,
    required this.missionIcon,
    required this.missionName,
    required this.missionInformation,
    this.iconWidth = 50,
    this.missionNameFontSize = 24,
    this.missionInformationFontSize = 16,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsetsDirectional.only(top: margin, bottom: margin),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(children: <Widget>[
          SizedBox(
            width: iconWidth,
            child: missionIcon,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  missionName,
                  style: TextStyle(
                      fontSize: missionNameFontSize,
                      fontWeight: FontWeight.bold),
                ),
                if (missionInformation.isNotEmpty)
                  Text(
                    missionInformation,
                    style: TextStyle(
                        fontSize: missionInformationFontSize,
                        color: Colors.blue),
                  ),
              ],
            ),
          ),
          if (onSelected)
            SizedBox(
                width: iconWidth,
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                )),
        ]),
      ),
    );
  }
}
