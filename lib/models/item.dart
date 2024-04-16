import 'dart:convert';

import 'package:facturo/models/item_type.dart';
import 'package:hive/hive.dart';
part 'item.g.dart';

@HiveType(typeId: 2)

class Item {
  @HiveField(0)

   int id;
  @HiveField(1)

  final String name;
  @HiveField(2)

  


  final double price;
  @HiveField(3)

  final ItemType itemType;

  Item(
      {required this.id,
      required this.name,
    
      required this.price,
      required this.itemType,
      
      });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'itemType': itemType,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
     
      price: map['price'] ?? 0.0,
      itemType: ItemType.fromJson(map['itemType']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));
}
