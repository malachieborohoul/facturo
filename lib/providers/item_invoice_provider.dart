import 'package:facturo/models/item_invoice.dart';
import 'package:flutter/foundation.dart';

class ItemInvoiceProvider extends ChangeNotifier {
  List<ItemInvoice> _itemsInvoice = [];

  List<ItemInvoice> get itemsInvoice => _itemsInvoice;
  

  // Check if item exist? If it doesn't add to the list
  void addItem(ItemInvoice itemInvoice) {
    bool isFound = false;
    print("addItem");
    for (var item in _itemsInvoice) {
      if (item.id == itemInvoice.id) {
        isFound = true;

        break;
      }
      // isFound = false;
    }

    if (!isFound) {
      _itemsInvoice.add(itemInvoice); // Ajoute l'élément à la liste
      notifyListeners();
    }
  }

  void editItemQuantity(ItemInvoice itemInvoice, int quantity) {
    bool isFound = false;
    for (var item in _itemsInvoice) {
      if (item.id == itemInvoice.id) {
        isFound = true;
        item.quantity = quantity;
        
        notifyListeners();
        break;
      }
      // isFound = false;
    }

    // if (!isFound) {
    //   _itemsInvoice.add(itemInvoice); // Ajoute l'élément à la liste
    //   notifyListeners();
    // }
  }

  // void editItemQuantity(Item item, int quantity) {
  //   final invoiceItem =
  //       ItemInvoice(id: 0, invoice: emptyInvoice, item: item, quantity: 0);
  //   if (!_invoiceItems.contains(invoiceItem)) {
  //     _invoiceItems.add(ItemInvoice(
  //         id: 0,
  //         invoice: emptyInvoice,
  //         item: item,
  //         quantity: quantity)); // Ajoute l'élément à la liste

  //     notifyListeners();
  //   }
  // }

  void removeItem(ItemInvoice itemInvoice, int quantity) {
    itemInvoice.quantity = quantity;
    _itemsInvoice.remove(
      itemInvoice
        ); // Supprime l'élément de la liste
    notifyListeners();
  }
}
