import 'package:facturo/models/client.dart';
import 'package:facturo/models/invoice.dart';
import 'package:facturo/models/invoice_item.dart';
import 'package:facturo/models/item.dart';
import 'package:facturo/models/item_type.dart';
import 'package:facturo/providers/item_invoice_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

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
      // Add invoice and get its returned id
      final invoiceId = await invoices.add(Invoice.fromMap({
        'number': number,
        'currentDate': currentDate,
        'dueDate': dueDate,
        'client': client.toJson(),
      }));
      // Get the invoice object by id
      final invoice = invoices.getAt(invoiceId);
      final itemInvoiceProvider =
          Provider.of<ItemInvoiceProvider>(context).itemsInvoice;

      // Loop through the item invoice provider which is a list

      for (var itemInvoice in itemInvoiceProvider) {
        // Retreive item element to construct an item object
        Item item = Item.fromMap({
          'id': itemInvoice.id,
          'name': itemInvoice.name,
          'price': itemInvoice.price,
          'itemType': itemInvoice.itemType.toJson(),
        });
        //Add invoiceItem with invoice, item objects and quantity variable
        await invoiceItems.add(InvoiceItem.fromMap({
          'invoice': invoice.toJson(),
          'item': item.toJson(),
          'quantity': itemInvoice.quantity,
        }));
      }

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
