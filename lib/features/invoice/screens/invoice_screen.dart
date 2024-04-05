import 'package:facturo/common/widgets/custom_searchbar.dart';
import 'package:facturo/common/widgets/dashboard_menu.dart';
import 'package:facturo/common/widgets/header_invoice_table.dart';
import 'package:facturo/common/widgets/row_invoice_table.dart';
import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:facturo/data/invoice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InvoiceScreen extends StatefulWidget {
  static const routeName = '/invoices';
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  TextEditingController searchController = TextEditingController();

  int selectedRowInvoice = invoices.first.id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          const Expanded(flex: 2, child: DashboardMenu()),
          Expanded(
              flex: 8,
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: background,
                            border: Border(bottom: BorderSide(color: neutral))),
                        child: Padding(
                          padding: const EdgeInsets.all(appPadding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Invoices",
                                style: TextStyle(
                                    fontSize: headingFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add,
                                      )),
                                  const SizedBox(
                                    width: miniSpacer,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.delete_outlined)),
                                  const SizedBox(
                                    width: miniSpacer,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.edit_outlined)),
                                  const SizedBox(
                                    width: miniSpacer,
                                  ),
                                  CustomSearchbar(
                                      controller: searchController,
                                      hintText: "Search",
                                      size: 200,
                                      onSuccess: () {})
                                ],
                              )
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 9,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 6,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: background,
                                    border: Border(
                                        right: BorderSide(color: neutral))),
                                child: Column(
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.all(appPadding),
                                        child: HeaderInvoiceTable()),
                                    Expanded(
                                      child: ListView.builder(
                                          itemCount: invoices.length,
                                          itemBuilder: (context, i) {
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectedRowInvoice =
                                                      invoices[i].id;
                                                });
                                              },
                                              child: RowInvoiceTable(
                                                  selected:
                                                      selectedRowInvoice ==
                                                              invoices[i].id
                                                          ? true
                                                          : false,
                                                  client: invoices[i].client,
                                                  amount: invoices[i].amount,
                                                  status: invoices[i].status),
                                            );
                                          }),
                                    )
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 4,
                              child: Container(
                                color: background,
                              )),
                        ],
                      ))
                ],
              )),
        ],
      )),
    );
  }
}
