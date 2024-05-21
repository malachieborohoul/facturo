
import 'dart:convert';

import 'package:facturo/models/client.dart';
import 'package:hive/hive.dart';
part 'invoice.g.dart';


@HiveType(typeId: 1)
class Invoice {
  @HiveField(0)

   int id;
  @HiveField(1)

   String number;
  @HiveField(2)

  final String currentDate;
  @HiveField(3)

  final String dueDate;
  @HiveField(4)

  final Client client;
  @HiveField(5)

  final bool paid;

  Invoice({required this.id, required this.client, required this.number, required this.paid, required this.currentDate, required this.dueDate});

    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
      'currentDate': currentDate,
      'dueDate': dueDate,
      'client': client,
      'paid': paid,
   
    };
  }

  factory Invoice.fromMap(Map<String, dynamic> map) {
    return Invoice(
      id: map['id'] ?? 0,
      number: map['number'] ?? '',
      currentDate: map['currentDate'] ?? '',
      dueDate: map['dueDate'] ?? '',
      client: Client.fromJson(map['client']),
      paid: map['paid'] ?? false,

  
    );
  }

  String toJson() => json.encode(toMap());

  factory Invoice.fromJson(String source) => Invoice.fromMap(json.decode(source));

}



