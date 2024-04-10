import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/material.dart';

class DashboardMenuItem extends StatelessWidget {
  const DashboardMenuItem({super.key, required this.icon, required this.name,   this.selected=false});
  final IconData icon;
  final String name;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: miniSpacer/2),
      child: Container(
        width: double.infinity,
        decoration:  BoxDecoration(
            color: selected? Colors.black12 : null,
            borderRadius: const BorderRadius.all(Radius.circular(smallFontSize))),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: miniSpacer / 2, horizontal: miniSpacer),
          child: Row(
            children: [
              Icon(
                icon,
                size: smallFontSize,
              ),
              const SizedBox(
                width: miniSpacer,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: textBlack,
                  fontSize: smallFontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
