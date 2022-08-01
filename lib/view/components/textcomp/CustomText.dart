import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
String? title ;
var colorText;
double? fontSize;
var fontWeight = FontWeight.bold;

CustomText({
  this.title,
  required this.colorText,
  this.fontSize,
  required this.fontWeight,
});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "$title",
        style: TextStyle(
          color: colorText,
          fontSize: fontSize,
          fontWeight: fontWeight
        ),
      ),
    );
  }


}
