import 'package:facturo/core/constants/size.dart';
import 'package:flutter/material.dart';

class RemoveItemButton extends StatelessWidget {
  const RemoveItemButton({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.remove_circle,
          size: mediumFontSize,
          color: Colors.red,
        ),
        const SizedBox(
          width: smallFontSize,
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: smallFontSize * 0.8, fontWeight: FontWeight.bold, color: Colors.black),
        )
      ],
    );
  }
}
