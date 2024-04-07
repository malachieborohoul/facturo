import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddRowItem extends StatelessWidget {
  const AddRowItem({super.key, required this.name, required this.quantity, required this.price});
  final String name;
  final int quantity;
  final double price;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: smallFontSize*0.5),
      child: Row(
        children: [
          Expanded(
            child: Row(
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
                  name,
                  style: const TextStyle(
                      fontSize: smallFontSize * 0.8, fontWeight: FontWeight.bold, color: Colors.black),
                )
              ],
            ),
          ),
           Expanded(child: Text(quantity.toString())),
           Expanded(child: Text(price.toString())),
        ],
      ),
    );
  }
}
