import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/material.dart';

class CustomTypeItem extends StatelessWidget {
  const CustomTypeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: miniSpacer),
      child: Text(
        "Batterie",
        style: TextStyle(
            fontSize: smallFontSize * 0.8, fontWeight: FontWeight.bold),
      ),
    );
  }
}
