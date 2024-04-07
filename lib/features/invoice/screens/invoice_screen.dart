import 'package:facturo/common/widgets/custom_item.dart';
import 'package:facturo/common/widgets/custom_searchbar.dart';
import 'package:facturo/common/widgets/custom_total_item.dart';
import 'package:facturo/common/widgets/custom_type_item.dart';
import 'package:facturo/common/widgets/dashboard_menu.dart';
import 'package:facturo/common/widgets/header_invoice_table.dart';
import 'package:facturo/common/widgets/invoice/row_invoice_table.dart';
import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:facturo/data/invoice.dart';
import 'package:facturo/features/invoice/screens/add_invoice_screen.dart';
import 'package:flutter/material.dart';

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
                                      onPressed: () {
                                        Navigator.pushNamed(context,
                                            AddInvoiceScreen.routeName);
                                      },
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
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Container(
                                      color: background,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(appPadding),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "ALC",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: miniSpacer,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: neutralBorder),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(
                                                          smallFontSize / 2))),
                                          child: const Padding(
                                            padding:
                                                EdgeInsets.symmetric(vertical:miniSpacer / 2, horizontal: appPadding),
                                            child: Text("Inv "),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: miniSpacer,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: neutralBorder),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(
                                                          smallFontSize / 2))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical:miniSpacer / 2, horizontal: appPadding),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Amount due",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  smallFontSize *
                                                                      0.8),
                                                        ),
                                                        Text("2000",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ],
                                                    ),
                                                    Container(
                                                      decoration: const BoxDecoration(
                                                          color: Colors.amber,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      smallFontSize))),
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(
                                                            miniSpacer / 2),
                                                        child: Text(
                                                          "Pending",
                                                          style: TextStyle(
                                                            fontSize:
                                                                smallFontSize *
                                                                    0.8,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: miniSpacer,
                                                ),
                                                const Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Issued on",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  smallFontSize *
                                                                      0.8),
                                                        ),
                                                        Text("31 Jan 2024",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    smallFontSize *
                                                                        0.8)),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Due on",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  smallFontSize *
                                                                      0.8),
                                                        ),
                                                        Text("31 Jan 2024",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    smallFontSize *
                                                                        0.8)),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: smallSpacer,
                                        ),
                                        const Text(
                                          "Items",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: miniSpacer,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: neutralBorder),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(
                                                          smallFontSize / 2))),
                                          child: const Padding(
                                            padding:
                                                EdgeInsets.symmetric(vertical:miniSpacer / 2, horizontal: appPadding),
                                            child: Column(
                                              children: [
                                                CustomTypeItem(),
                                                CustomItem(),
                                                CustomItem(),
                                                CustomItem(),
                                                CustomTotalItem()
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.all(appPadding),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              color: secondary,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      smallFontSize))),
                                          child: const Padding(
                                            padding:
                                                EdgeInsets.all(miniSpacer / 2),
                                            child: Center(
                                                child: Text(
                                              "Mark as Paid",
                                              style:
                                                  TextStyle(color: textWhite),
                                            )),
                                          ),
                                        ),
                                      ))
                                ],
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
