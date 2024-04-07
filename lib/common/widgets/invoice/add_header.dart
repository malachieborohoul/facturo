import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/material.dart';

class AddHeader extends StatelessWidget {
  const AddHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style: const TextStyle(fontSize: smallFontSize * 0.8, color: textBlack),
    );
  }
}
