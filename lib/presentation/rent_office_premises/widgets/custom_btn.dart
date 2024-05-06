import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    super.key,
    this.title = "Custom title",
    this.fontWeight = FontWeight.w500,
    this.color = Colors.white,
    required this.ontap,
    this.txtColor = Colors.black,
    this.fontSize = 16.0,
    this.height = 50.0,
    this.width = 150.0,
  });
  final String title;
  final FontWeight fontWeight;
  final Color color;
  final Function ontap;
  final Color txtColor;
  final double fontSize;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            color: txtColor,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
