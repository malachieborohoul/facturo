import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/material.dart';

class CustomNotFound extends StatelessWidget {
  const CustomNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Icon(Icons.search, size: 100, color: textBlack,),
      Text("Nothing found"),
      Text("Tap on + to add"),
    ],);
  }
}