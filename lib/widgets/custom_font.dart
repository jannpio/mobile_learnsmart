import 'package:flutter/material.dart';

class CustomFont extends StatelessWidget {
  const CustomFont({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    this.fontFamily = "Poppins",
    this.fontWeight = FontWeight.normal, 
    this.textAlign = TextAlign.left,     
    this.fontStyle = FontStyle.normal,   
    this.letterSpacing = 0.0,
  });

  final String text;
  final double fontSize;
  final double letterSpacing;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String fontFamily;
  final FontStyle fontStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
