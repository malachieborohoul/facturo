import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:facturo/models/item_type.dart';
import 'package:flutter/material.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key, required this.id, required this.name, required this.quantity, required this.price, required this.itemType});
  final int id;

  final String name;

  final int quantity;
  final double price;

  final ItemType itemType; 

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: miniSpacer),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                    fontSize: smallFontSize * 0.8, fontWeight: FontWeight.bold),
              ),
              Text(
                "QTY $quantity x $price",
                style: const TextStyle(
                  fontSize: smallFontSize * 0.7,
                ),
              ),
            ],
          ),
          const Text(
            "2000",
            style: TextStyle(
                fontSize: smallFontSize * 0.8, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
