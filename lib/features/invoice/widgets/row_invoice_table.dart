import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:facturo/models/invoice.dart';
import 'package:flutter/material.dart';

class RowInvoiceTable extends StatelessWidget {
  const RowInvoiceTable(
      {super.key,
      this.selected = false,
      required this.client,
      required this.amount,
      required this.status, required this.invoice});
  final bool selected;

  final String client;
  final double amount;
  final String status;
  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: appPadding, vertical: miniSpacer / 2),
      child: Container(
        decoration: BoxDecoration(
            color: selected ? secondary : null,
            borderRadius:
                const BorderRadius.all(Radius.circular(smallFontSize))),
        child: Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: appPadding),
                child: Text(
                  client,
                  style: TextStyle(color: selected ? textWhite : textBlack),
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: appPadding),
                child: Text(
                  invoice.number,
                  style: TextStyle(color: selected ? textWhite : textBlack),
                ),
              )),
              //  Expanded(
              //     child: Padding(
              //   padding: const EdgeInsets.only(left: appPadding),
              //   child: Text(amount.toString(), style: TextStyle(color: selected ? textWhite: textBlack),),
              // )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: appPadding),
                child: Text(
                  status,
                  style: TextStyle(color: selected ? textWhite : textBlack),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
