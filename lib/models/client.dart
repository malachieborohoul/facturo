import 'dart:convert';

class Client {
  final String id;
  final String businessName;
  final String name;
  final String address;

  Client( {required this.id, required this.businessName, required this.name, required this.address});

    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'businessName': businessName,
      'name': name,
      'address': address,
   
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map['id'] ?? '',
      businessName: map['businessName'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
  
    );
  }

  String toJson() => json.encode(toMap());

  factory Client.fromJson(String source) => Client.fromMap(json.decode(source));

  
}
