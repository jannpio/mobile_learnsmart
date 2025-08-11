import '../widgets/custom_font.dart';
import '../constants.dart';
import 'package:flutter/material.dart';

class CustomInkwellButton extends StatelessWidget {
  final VoidCallback onTap;
  final double height;
  final double width;
  final double fontSize;
  final String buttonName;
  final Icon icon;
  final FontWeight fontWeight;
  final Color bgColor;
  final Color fontColor;
  final double borderRadius; 

  CustomInkwellButton({
    super.key,
    required this.onTap,
    required this.height,
    required this.width,
    this.buttonName = '',
    this.bgColor = BG_PRIMARY,
    this.fontColor = Colors.white,
    this.fontSize = 14.0,
    this.icon = const Icon(null),
    this.fontWeight = FontWeight.normal,
    this.borderRadius = 50.0, 
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius), 
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius), 
        splashColor: BG_SECONDARY,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius), 
          ),
          child: Center(
            child: buttonName.isEmpty
                ? icon
                : CustomFont(
                    text: buttonName,
                    fontSize: fontSize,
                    color: fontColor,
                    fontWeight: fontWeight,
                  ),
          ),
        ),
      ),
    );
  }
}
