import 'dart:convert';

import 'package:facturo/models/invoice.dart';
import 'package:facturo/models/item_type.dart';

class Item {
  final String id;
  final String name;
  final int quantity;
  final double price;
  final Invoice invoice;
  final ItemType itemType;

  Item(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.price,
      required this.invoice,
      required this.itemType,
      
      });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
      'invoice': invoice,
      'itemType': itemType,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      quantity: map['quantity'] ?? 0,
      price: map['price'] ?? 0.0,
      invoice: Invoice.fromJson(map['invoice']),
      itemType: ItemType.fromJson(map['itemType']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));
}
