import 'dart:convert';

import 'package:facturo/models/item_type.dart';

class ItemInvoice {
  int id;

  final String name;

  int quantity;
  final double price;

  final ItemType itemType;

  ItemInvoice({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.itemType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
      'itemType': itemType,
    };
  }

  factory ItemInvoice.fromMap(Map<String, dynamic> map) {
    return ItemInvoice(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      quantity: map['quantity'] ?? 0,
      price: map['price'] ?? 0.0,
      itemType: ItemType.fromJson(map['itemType']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemInvoice.fromJson(String source) =>
      ItemInvoice.fromMap(json.decode(source));
}
