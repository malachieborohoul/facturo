import 'package:facturo/models/item.dart';
import 'package:flutter/foundation.dart';

class ItemProvider extends ChangeNotifier {
  List<Item> _items = [];
  List<Item> get items => _items;

  void addItem(Item item) {
    if(!_items.contains(item)){
    _items.add(item); // Ajoute l'élément à la liste

    notifyListeners();
    }
  }

  void removeItem(Item item) {
    _items.remove(item); // Supprime l'élément de la liste
    notifyListeners();
  }
}
