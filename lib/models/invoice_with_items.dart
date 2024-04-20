import 'dart:convert';

import 'package:facturo/models/invoice.dart';
import 'package:facturo/models/item_invoice.dart';

class InvoiceWithItems {
   Invoice invoice;
  final List<ItemInvoice> itemsInvoice;

  InvoiceWithItems({
    required this.invoice,
    required this.itemsInvoice,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'invoice': invoice.toMap(),
      'itemsInvoice': itemsInvoice.map((x) => x.toMap()).toList(),
    };
  }

  factory InvoiceWithItems.fromMap(Map<String, dynamic> map) {
    return InvoiceWithItems(
      invoice: Invoice.fromMap(map['invoice'] as Map<String,dynamic>),
      itemsInvoice: List<ItemInvoice>.from((map['itemsInvoice'] as List<int>).map<ItemInvoice>((x) => ItemInvoice.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory InvoiceWithItems.fromJson(String source) => InvoiceWithItems.fromMap(json.decode(source) as Map<String, dynamic>);
}
