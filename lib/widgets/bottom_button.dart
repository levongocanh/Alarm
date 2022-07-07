// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final double height;
  final EdgeInsetsGeometry margin;
  final double borderRadius;
  final VoidCallback onTap;
  final Color color;
  final double textSize;

  BottomButton({
    required this.text,
    this.height = 60,
    this.margin = const EdgeInsetsDirectional.all(10),
    this.borderRadius = 8,
    required this.onTap,
    this.color = Colors.blueAccent,
    this.textSize = 24,
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
            style: TextStyle(fontSize: textSize, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
