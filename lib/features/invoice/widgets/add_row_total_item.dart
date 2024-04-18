import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:facturo/providers/item_invoice_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRowTotalItem extends StatelessWidget {
  const AddRowTotalItem({super.key, required this.total});

  final double total;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double totalPrice = 0;
    final itemInvoiceProvider =
        Provider.of<ItemInvoiceProvider>(context).itemsInvoice;

    for (var itemInvoice in itemInvoiceProvider) {
      totalPrice += itemInvoice.quantity * itemInvoice.price;
    }

    return Container(
      width: size.width * 0.7,
      decoration: const BoxDecoration(
          color: textWhite,
          borderRadius: BorderRadius.all(Radius.circular(smallFontSize))),
      child: Padding(
        padding: const EdgeInsets.all(appPadding),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                    child: Text(
                  "Total",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Expanded(child: Text(totalPrice.toString())),
              ],
            )
          ],
        ),
      ),
    );
  }
}
