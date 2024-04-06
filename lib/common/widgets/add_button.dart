import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add_circle_outlined,
          size: smallFontSize,
          color: primary,
        ),
        SizedBox(
          width: smallFontSize,
        ),
        Text(
          "Add Client",
          style: TextStyle(
              fontSize: smallFontSize * 0.8, fontWeight: FontWeight.bold, color: primary),
        )
      ],
    );
  }
}
