import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: textBlack,
          fontSize: headingFontSize,
          fontWeight: FontWeight.bold),
    );
  }
}
