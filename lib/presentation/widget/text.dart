import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  const TextWidget(
      {super.key,
      required this.title,
      this.fontWeight,
      this.fontSize,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color ?? Colors.black,
        fontWeight: fontWeight,
        fontSize: fontSize ?? 12,
      ),
    );
  }
}
