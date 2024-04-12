import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({super.key, required this.title,  this.bgColor=secondary,  this.color=textWhite});
  final String title;
  final Color bgColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(smallFontSize))),
      child:  Padding(
        padding: const EdgeInsets.symmetric(vertical: miniSpacer / 2, horizontal: smallSpacer),
        child: Center(
            child: Text(
          title,
          style: TextStyle(color: color),
        )),
      ),
    );
  }
}
