import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:facturo/features/inventory/screens/edit_item_type_screen.dart';
import 'package:facturo/models/item_type.dart';
import 'package:flutter/material.dart';

class ItemTypeCard extends StatelessWidget {
  const ItemTypeCard({super.key, required this.itemType, required this.onSuccessDelete, required this.onSuccessEdit,  this.isActionButtons=true});

  final ItemType itemType;
  final VoidCallback onSuccessDelete;
  final VoidCallback onSuccessEdit;
  final bool isActionButtons; //The widget has edi and delte buttons 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: isActionButtons? miniSpacer:0),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(smallFontSize))
      
      
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:  appPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Row(children: [
                const Icon(Icons.inventory_2_outlined, color: textBlack,),
                const SizedBox(width: smallFontSize,),
                Text(itemType.name)
              ],),
          
                  isActionButtons?  Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        var result = await Navigator.pushNamed(
                            context, EditItemTypeScreen.routeName,
                            arguments: itemType);
                        if (result == true) {
                          onSuccessEdit();
                        }
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: textBlack,
                      )),
                  IconButton(
                      onPressed: () {
                        onSuccessDelete();
                      },
                      icon: const Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.redAccent,
                      ))
                ],
              ): const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
