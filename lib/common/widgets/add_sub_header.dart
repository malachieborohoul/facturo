import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/material.dart';

class AddSubHeader extends StatelessWidget {
  const AddSubHeader({super.key, required this.title,  this.size=200});
  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(title,
          style: const TextStyle(
            fontSize: smallFontSize * 0.8,
          )),
    );
  }
}
