
import 'dart:convert';

import 'package:facturo/models/client.dart';

class Invoice {
  final String id;
  final String number;
  final String currentDate;
  final String dueDate;
  final Client client;
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
      id: map['id'] ?? '',
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



