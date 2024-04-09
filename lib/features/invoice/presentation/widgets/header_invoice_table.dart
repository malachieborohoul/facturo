import 'package:facturo/core/constants/color.dart';
import 'package:facturo/core/constants/padding.dart';
import 'package:flutter/material.dart';

class HeaderInvoiceTable extends StatelessWidget {
  const HeaderInvoiceTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
                decoration: const BoxDecoration(
                    border: Border(right: BorderSide(color: neutralBorder))),
                child: const Padding(
                  padding: EdgeInsets.only(left: appPadding),
                  child: Text("Client"),
                ))),
        Expanded(
            child: Container(
                decoration: const BoxDecoration(
                    border: Border(right: BorderSide(color: neutralBorder))),
                child: const Padding(
                  padding: EdgeInsets.only(left: appPadding),
                  child: Text("Invoice"),
                ))),
        Expanded(
            child: Container(
                decoration: const BoxDecoration(
                    border: Border(right: BorderSide(color: neutralBorder))),
                child: const Padding(
                  padding: EdgeInsets.only(left: appPadding),
                  child: Text("Amount"),
                ))),
        Expanded(
            child: Container(
                decoration: const BoxDecoration(),
                child: const Padding(
                  padding: EdgeInsets.only(left: appPadding),
                  child: Text("Status"),
                ))),
      ],
    );
  }
}
