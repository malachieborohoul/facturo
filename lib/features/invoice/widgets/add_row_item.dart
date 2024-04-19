import 'package:facturo/common/widgets/custom_textfield.dart';
import 'package:facturo/constants/size.dart';
import 'package:facturo/models/item_invoice.dart';
import 'package:facturo/providers/item_invoice_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRowItem extends StatelessWidget {
  AddRowItem(
      {super.key, required this.quantityController, required this.itemInvoice});
  final ItemInvoice itemInvoice;

  TextEditingController quantityController;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      quantityController.text = quantityController.text.trim();
    } else {
      quantityController.text = itemInvoice.quantity.toString();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: smallFontSize * 0.5),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                const Icon(
                  Icons.remove_circle,
                  size: mediumFontSize,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: smallFontSize,
                ),
                Text(
                  itemInvoice.name,
                  style: const TextStyle(
                      fontSize: smallFontSize * 0.8,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
          ),
          Expanded(
            child: CustomTextfield(
              controller: quantityController,
              textInputType: TextInputType.number,
              hintText: "Quantity",
              onSuccess: () {},
              onChange: (String param) {
                if (kDebugMode) {
                  print(param);
                }
                if (quantityController.text.isNotEmpty){
                  Provider.of<ItemInvoiceProvider>(context, listen: false)
                    .editItemQuantity(itemInvoice, int.parse(param));
                }else{
                  Provider.of<ItemInvoiceProvider>(context, listen: false)
                    .editItemQuantity(itemInvoice, 0);
                }
                
                // isLoading = true;
              },
            ),
          ),
          //  Expanded(child: Text(quantity.toString())),
          Expanded(child: Text(itemInvoice.price.toString())),
        ],
      ),
    );
  }
}
