import 'dart:convert';
import 'package:hive/hive.dart';
part 'item_type.g.dart';

@HiveType(typeId: 4)

class ItemType {
  @HiveField(0)

   int id;
  @HiveField(1)

  final String name;
  @HiveField(2)

  final String description;

  ItemType( {required this.id,  required this.name, required this.description});

    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
   
    };
  }

  factory ItemType.fromMap(Map<String, dynamic> map) {
    return ItemType(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
  
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemType.fromJson(String source) => ItemType.fromMap(json.decode(source));

  
}
