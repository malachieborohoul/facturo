import 'package:facturo/core/constants/padding.dart';
import 'package:facturo/core/constants/size.dart';
import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: miniSpacer),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Web developement",
                style: TextStyle(
                    fontSize: smallFontSize * 0.8, fontWeight: FontWeight.bold),
              ),
              Text(
                "QTY 12 x 100",
                style: TextStyle(
                  fontSize: smallFontSize * 0.7,
                ),
              ),
            ],
          ),
          Text(
            "2000",
            style: TextStyle(
                fontSize: smallFontSize * 0.8, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
