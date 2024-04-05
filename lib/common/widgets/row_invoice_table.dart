import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:flutter/material.dart';

class RowInvoiceTable extends StatelessWidget {
  const RowInvoiceTable({super.key});


  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(appPadding),
      child: Row(
        children: [
          Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: appPadding),
                child: Text("ALC"),
              )),
          Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: appPadding),
                child: Text("Inv 1"),
              )),
          Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: appPadding),
                child: Text("2000"),
              )),
          Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: appPadding),
                child: Text("Pending"),
              )),
        ],
      ),
    );
  }
}
