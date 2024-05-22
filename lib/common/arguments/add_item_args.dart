// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:facturo/models/item_type.dart';

class AddItemArgs {
  final bool isFromHome;
  final ItemType itemType;
  AddItemArgs({
    required this.isFromHome,
    required this.itemType,
  });
}
