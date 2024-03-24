import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final Alignment alignment;
  final int? maxLines;
  final double? height;
  final TextOverflow? overflow;
  final EdgeInsetsGeometry? padding;
  final String? fontFamily;
  CustomText(
   
      {
         this.fontFamily='',
        this.text = '',
      this.padding,
      this.fontSize = 16,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.white,
      this.alignment = Alignment.topLeft,
      this.maxLines,
      this.height,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: fontFamily,
          overflow: overflow,
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          height: height,
        ),
        maxLines: maxLines,
      ),
    );
  }
}
