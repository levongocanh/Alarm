import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final double height;
  final EdgeInsetsGeometry margin;
  final double borderRadius;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;
  final double textSize;

  const BottomButton({
    required this.text,
    this.height = 55,
    this.margin = const EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 10),
    this.borderRadius = 8,
    required this.onTap,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.textSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: textSize, color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
