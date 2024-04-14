// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:facturo/models/item.dart';
import 'package:facturo/models/item_type.dart';

class EditItemArgs {
  final Item item;
  final ItemType itemType;
  EditItemArgs({
    required this.item,
    required this.itemType,
  });
}
