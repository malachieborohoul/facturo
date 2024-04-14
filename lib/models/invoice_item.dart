import 'dart:convert';

import 'package:facturo/models/invoice.dart';
import 'package:facturo/models/item.dart';
import 'package:hive/hive.dart';
part 'invoice_item.g.dart';

@HiveType(typeId: 5)
class InvoiceItem {
  @HiveField(0)
  int id;
  @HiveField(1)
  final Invoice invoice;
  @HiveField(2)
  final Item item;

  InvoiceItem({
    required this.id,
    required this.invoice,
    required this.item,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'invoice': invoice,
      'item': item,
    };
  }

  factory InvoiceItem.fromMap(Map<String, dynamic> map) {
    return InvoiceItem(
      id: map['id'] ?? 0,
      invoice: Invoice.fromJson(map['invoice']),
      item: Item.fromJson(map['item']),
    );
  }

  String toJson() => json.encode(toMap());

  factory InvoiceItem.fromJson(String source) =>
      InvoiceItem.fromMap(json.decode(source));
}
