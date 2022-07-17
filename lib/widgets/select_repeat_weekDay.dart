import 'package:flutter/material.dart';

class SelectRepeatWeekDay extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final double fontSize;
  final double margin;
  final double borderRadius;
  final Color color;
  final VoidCallback onTap;

  SelectRepeatWeekDay({
    required this.text,
    this.height = 40,
    this.width = 40,
    this.fontSize = 18,
    this.margin = 5,
    this.borderRadius = 5,
    this.color = Colors.black54,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: color,
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}
