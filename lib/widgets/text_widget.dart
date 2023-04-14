import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {required this.label, this.color, this.fontSize = 18, this.fontWeight});

  final String label;
  final double fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: color?? Colors.white,
        fontSize: fontSize,
        fontWeight: fontWeight?? FontWeight.w500,
      ),
    );
  }
}
