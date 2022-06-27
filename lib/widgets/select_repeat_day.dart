

// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SelectRepeatDay extends StatelessWidget {
  final String day;
  final double height; 
  final double width;
  final double fontSize;
  final double margin;
  final double borderRadius;
  final Color color;
  final VoidCallback onTap;

  SelectRepeatDay({
    required this.day,
    this.height = 45,
    this.width = 45,
    this.fontSize = 20,
    this.margin = 3, 
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
        // change state selected of day for repeat here
        onTap: onTap,
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: fontSize
            ),
          ),
        ),
      ),
    );
  }
}