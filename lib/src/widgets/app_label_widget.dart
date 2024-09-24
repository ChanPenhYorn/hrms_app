import 'package:flutter/material.dart';
import 'package:hrms_app/src/core/utils/text_style.dart';

class AppLabel extends StatelessWidget {
  const AppLabel({
    super.key,
    this.label,
    this.isRequired = false,
    this.fontSize,
    this.color,
  });

  final String? label;
  final bool? isRequired;
  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: RichText(
            text: TextSpan(children: [
          TextSpan(
            text: label ?? "Label Name",
            style: AppFonts.getTextStyle(
                fontSize: fontSize ?? 16, color: color ?? Colors.black),
          ),
          TextSpan(
            text: isRequired == true ? '*' : "",
            style: AppFonts.getTextStyle(fontSize: 16, color: Colors.red),
          ),
        ])));
  }
}
