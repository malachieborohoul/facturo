import 'dart:convert';

class ItemType {
  final String id;
  final String name;
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
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
  
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemType.fromJson(String source) => ItemType.fromMap(json.decode(source));

  
}
