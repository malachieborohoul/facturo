import 'package:facturo/models/item_type.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class InventoryService {
  final itemTypes = Hive.box("item_types");

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
}
