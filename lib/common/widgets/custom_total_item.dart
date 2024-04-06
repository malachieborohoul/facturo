import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/material.dart';

class CustomTotalItem extends StatelessWidget {
  const CustomTotalItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: miniSpacer),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total",
            style: TextStyle(
                fontSize: smallFontSize * 0.8, fontWeight: FontWeight.bold,color: primary),
          ),
          Text(
            "2000",
            style: TextStyle(
                fontSize: smallFontSize * 0.9, fontWeight: FontWeight.bold,color: primary),
          ),
        ],
      ),
    );
  }
}
