import 'package:facturo/models/client.dart';
import 'package:facturo/models/invoice.dart';
import 'package:facturo/models/item.dart';
import 'package:facturo/models/item_type.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class InvoiceService {
  final invoices = Hive.box("invoices");
  final invoiceItems = Hive.box("invoice_items");

  
 
  void addInvoice({
    required BuildContext context,
    required String number,
    required String currentDate,
    required String dueDate,
    required Client client,
    required VoidCallback onSuccess,
    required VoidCallback onFailed,
  }) async {
    try {
    final clientRes = await invoiceItems.add(
      Invoice.fromMap({
        'number': number,
        'currentDate': currentDate,
        'dueDate': dueDate,
        'client': client.toJson(),
      }));

      onSuccess();

      // if (kDebugMode) {
      //   print(item_types);
      // }
    } catch (e) {
      // showSnackBar(context, e.toString());
      // showSnackBar(context, "Please Check your internet connection");
    }
  }

  // List<Item> getAllItems(BuildContext context, ItemType itemType) {
  //   List<Item> itemsList = [];

  //   try {
  //     items.keys.map((key) {
  //       var item = items.get(key) as Item;
  //       item.id = key;
  //       if (item.itemType.id == itemType.id) {
  //         itemsList.add(item);
  //       }
  //     }).toList();
  //   } catch (e) {
  //     // showSnackBar(context, e.toString());
  //     // showSnackBar(context, "Please Check your internet connection");
  //   }
  //   return itemsList;
  // }

  // void deleteItem({
  //   required BuildContext context,
  //   required Item item,
  //   required VoidCallback onSuccess,
  //   required VoidCallback onFailed,
  // }) async {
  //   try {
  //     items.delete(item.id);

  //     onSuccess();
  //   } catch (e) {
  //     // showSnackBar(context, e.toString());
  //     // showSnackBar(context, "Please Check your internet connection");
  //   }
  // }

  // void editItem({
  //   required BuildContext context,
  //   required String name,
  //   required int quantity,
  //   required double price,
  //   required ItemType itemType,
  //   required Item item,
  //   required VoidCallback onSuccess,
  //   required VoidCallback onFailed,
  // }) async {
  //   try {
  //     await items.put(
  //         item.id,
  //          Item.fromMap({
  //       'name': name,
  //       'quantity': quantity,
  //       'price': price,
  //       'itemType': itemType.toJson(),
  //     })
  //         );
  //     onSuccess();

  //     // if (kDebugMode) {
  //     //   print(item_types);
  //     // }
  //   } catch (e) {
  //     // showSnackBar(context, e.toString());
  //     // showSnackBar(context, "Please Check your internet connection");
  //   }
  // }
}
