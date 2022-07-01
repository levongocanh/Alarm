import 'package:flutter/material.dart';

class SelectMissionButton extends StatelessWidget {
  final double height;
  final double margin;
  final double borderRadius;
  final Color? color;
  final VoidCallback onTap;
  final Icon missionIcon;
  final String missionName;
  final double iconWidth;
  final double fontSize;

  const SelectMissionButton({
    this.height = 70,
    this.margin = 5,
    this.borderRadius = 8,
    this.color = Colors.grey,
    required this.onTap,
    required this.missionIcon,
    required this.missionName,
    this.iconWidth = 50,
    this.fontSize = 25,
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
            child: SizedBox(
              child: Text(
                missionName,
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(width: iconWidth, child: const Icon(Icons.chevron_right)),
        ]),
      ),
    );
  }
}
