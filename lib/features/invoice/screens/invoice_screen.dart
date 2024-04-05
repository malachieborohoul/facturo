import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                color: neutral,
                child: const Padding(
                  padding: EdgeInsets.all(appPadding),
                  child: Column(
                    children: [
                      Text("FACTURO",style: TextStyle(color: primary),)
                    ],
                  ),
                ),
              )),
          Expanded(
              flex: 5,
              child: Container(
                color: background,
              )),
          Expanded(
              flex: 3,
              child: Container(
                color: background,
              )),
        ],
      )),
    );
  }
}
