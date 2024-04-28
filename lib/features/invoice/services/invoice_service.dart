import 'package:facturo/models/client.dart';
import 'package:facturo/models/invoice.dart';
import 'package:facturo/models/invoice_item.dart';
import 'package:facturo/models/invoice_with_items.dart';
import 'package:facturo/models/item.dart';
import 'package:facturo/models/item_invoice.dart';
import 'package:flutter/foundation.dart';
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
    required bool paid,
    required List<ItemInvoice> itemInvoiceProvider,
    required VoidCallback onSuccess,
    required VoidCallback onFailed,
  }) async {
    try {
      // Add invoice and get its returned id
      final invoiceId = await invoices.add(Invoice.fromMap({
        'number': number,
        'currentDate': currentDate,
        'dueDate': dueDate,
        'paid': paid,
        'client': client.toJson(),
      }));
      if (kDebugMode) {
        print(invoiceId);
      }
      // Get the invoice object by id
      var invoice = invoices.get(invoiceId) as Invoice;
      invoice.id = invoiceId;
      if (kDebugMode) {
        print("Ok ${invoice.id} ${invoice.client.businessName}");
      }

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

  List<InvoiceWithItems> getAllInvoices(
    BuildContext context,
  ) {
    List<InvoiceWithItems> invoicesList = [];

    try {
      invoices.keys.forEach((invoiceKey) {
        var invoice = invoices.get(invoiceKey) as Invoice;
        invoice.id = invoiceKey;

        List<ItemInvoice> itemsInvoiceList = [];

        invoiceItems.keys.forEach((invoiceItemKey) {
          var invoiceItem = invoiceItems.get(invoiceItemKey) as InvoiceItem;
          invoiceItem.id = invoiceItemKey;
          if (invoiceItem.invoice.id == invoice.id) {
            ItemInvoice itemInvoice = ItemInvoice(
                id: invoiceItem.item.id,
                name: invoiceItem.item.name,
                quantity: invoiceItem.quantity,
                price: invoiceItem.item.price,
                itemType: invoiceItem.item.itemType);

            itemsInvoiceList.add(itemInvoice);
          }
        });
        invoicesList.add(
            InvoiceWithItems(invoice: invoice, itemsInvoice: itemsInvoiceList));
      });
    } catch (e) {
      // showSnackBar(context, e.toString());
      // showSnackBar(context, "Please Check your internet connection");
    }

    // print(invoicesList.first.itemsInvoice.toString());
    return invoicesList;
  }

  void deleteInvoice({
    required BuildContext context,
    required Invoice invoice,
    required VoidCallback onSuccess,
    required VoidCallback onFailed,
  }) async {
    try {
      invoices.delete(invoice.id);

      invoiceItems.keys.forEach(
        (invoiceItemKey) {
        var invoiceItem = invoiceItems.get(invoiceItemKey) as InvoiceItem;
        invoiceItem.id = invoiceItemKey;
          if (invoiceItem.invoice.id == invoice.id) {
            invoiceItems.delete(invoiceItemKey);
          }
        },
      );

      onSuccess();
    } catch (e) {
      // showSnackBar(context, e.toString());
      // showSnackBar(context, "Please Check your internet connection");
    }
  }

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
