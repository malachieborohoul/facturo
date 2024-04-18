import 'package:facturo/models/item.dart';
import 'package:facturo/models/item_type.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class InvoiceService {
  final itemTypes = Hive.box("item_types");
  final items = Hive.box("items");

  void addItemType({
    required BuildContext context,
    required String name,
    required String description,
    required VoidCallback onSuccess,
    required VoidCallback onFailed,
  }) async {
    try {
      await itemTypes.add(ItemType.fromMap({
        'name': name,
        'description': description,
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

  List<ItemType> getAllItemTypes(BuildContext context) {
    List<ItemType> itemTypesList = [];

    try {
      itemTypes.keys.map((key) {
        var itemType = itemTypes.get(key) as ItemType;
        itemType.id = key;
        itemTypesList.add(itemType);
      }).toList();
    } catch (e) {
      // showSnackBar(context, e.toString());
      // showSnackBar(context, "Please Check your internet connection");
    }
    return itemTypesList;
  }

  void deleteItemType({
    required BuildContext context,
    required ItemType itemType,
    required VoidCallback onSuccess,
    required VoidCallback onFailed,
  }) async {
    try {
      itemTypes.delete(itemType.id);

      onSuccess();
    } catch (e) {
      // showSnackBar(context, e.toString());
      // showSnackBar(context, "Please Check your internet connection");
    }
  }

  void editItemType({
    required BuildContext context,
    required String name,
    required String description,
    required ItemType itemType,
    required VoidCallback onSuccess,
    required VoidCallback onFailed,
  }) async {
    try {
      await itemTypes.put(
          itemType.id,
          ItemType.fromMap({
            'name': name,
            'description': description,
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

  void addItem({
    required BuildContext context,
    required String name,
    required double price,
    required ItemType itemType,
    required VoidCallback onSuccess,
    required VoidCallback onFailed,
  }) async {
    try {
     await items.add(
      Item.fromMap({
        'name': name,
        'price': price,
        'itemType': itemType.toJson(),
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

  List<Item> getAllItems(BuildContext context, ItemType itemType) {
    List<Item> itemsList = [];

    try {
      items.keys.map((key) {
        var item = items.get(key) as Item;
        item.id = key;
        if (item.itemType.id == itemType.id) {
          itemsList.add(item);
        }
      }).toList();
    } catch (e) {
      // showSnackBar(context, e.toString());
      // showSnackBar(context, "Please Check your internet connection");
    }
    return itemsList;
  }

  void deleteItem({
    required BuildContext context,
    required Item item,
    required VoidCallback onSuccess,
    required VoidCallback onFailed,
  }) async {
    try {
      items.delete(item.id);

      onSuccess();
    } catch (e) {
      // showSnackBar(context, e.toString());
      // showSnackBar(context, "Please Check your internet connection");
    }
  }

  void editItem({
    required BuildContext context,
    required String name,
    required int quantity,
    required double price,
    required ItemType itemType,
    required Item item,
    required VoidCallback onSuccess,
    required VoidCallback onFailed,
  }) async {
    try {
      await items.put(
          item.id,
           Item.fromMap({
        'name': name,
        'quantity': quantity,
        'price': price,
        'itemType': itemType.toJson(),
      })
          );
      onSuccess();

      // if (kDebugMode) {
      //   print(item_types);
      // }
    } catch (e) {
      // showSnackBar(context, e.toString());
      // showSnackBar(context, "Please Check your internet connection");
    }
  }
}
