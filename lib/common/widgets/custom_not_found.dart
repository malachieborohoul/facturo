import 'package:facturo/constants/color.dart';
import 'package:flutter/material.dart';

class CustomNotFound extends StatelessWidget {
  const CustomNotFound({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const Icon(
          Icons.search,
          size: 100,
          color: textBlack,
        ),
        Text("Pas de $message trouvé(es)"),
        Text("Appuyer sur + pour ajouter $message"),
      ],
    );
  }
}
