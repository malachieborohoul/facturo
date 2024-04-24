import 'package:facturo/common/widgets/confirmation_modal.dart';
import 'package:facturo/common/widgets/custom_button.dart';
import 'package:facturo/common/widgets/custom_item.dart';
import 'package:facturo/common/widgets/custom_searchbar.dart';
import 'package:facturo/common/widgets/custom_total_item.dart';
import 'package:facturo/common/widgets/dashboard_menu.dart';
import 'package:facturo/constants/global.dart';
import 'package:facturo/features/invoice/widgets/header_invoice_table.dart';
import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:facturo/features/invoice/screens/add_invoice_screen.dart';
import 'package:facturo/features/invoice/widgets/row_invoice_table.dart';
import 'package:facturo/models/invoice.dart';
import 'package:facturo/models/invoice_item.dart';
import 'package:facturo/models/invoice_with_items.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class InvoiceScreen extends StatefulWidget {
  static const routeName = '/invoices';
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  TextEditingController searchController = TextEditingController();
  late InvoiceWithItems selectedRowInvoice;
  double selectedTotalItemsPrice = 0.0;
  final invoiceItems = Hive.box("invoice_items");

  @override
  void initState() {
    getAllInvoices();

    invoiceItems.keys.forEach((invoiceItemKey) {
      var invoiceItem = invoiceItems.get(invoiceItemKey) as InvoiceItem;

      print(invoiceItem.invoice.id);
      selectedTotalItemsPrice = 0;
      selectedRowInvoice.itemsInvoice.forEach((element) {
        selectedTotalItemsPrice += element.quantity * element.price;
      });
    });
    super.initState();
  }

  late List<InvoiceWithItems> invoices;

  void getAllInvoices() {
    invoices = invoiceService.getAllInvoices(context);
    if (invoices.isNotEmpty) {
      selectedRowInvoice = invoices.first;
      // print(selectedRowInvoice.itemsInvoice.toString());
    }

    setState(() {});
  }

  void deleteInvoice(Invoice invoice) {
    invoiceService.deleteInvoice(
        context: context,
        invoice: invoice,
        onSuccess: () {
          // searchController.text = "";
          // isSeaching = false;
          getAllInvoices();
        },
        onFailed: () {});
    setState(() {});
  }

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
                                      onPressed: () async {
                                        final result =
                                            await Navigator.pushNamed(context,
                                                AddInvoiceScreen.routeName);

                                        if (result == true) {
                                          getAllInvoices();
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                      )),
                                  const SizedBox(
                                    width: miniSpacer,
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        var result = await Navigator.pushNamed(
                                            context,
                                            ConfirmationModal.routeName,
                                            arguments:
                                                "Do you want to delete this invoice");
                                        if (result == true) {
                                          // deleteItem(items[i]);
                                          deleteInvoice(
                                              selectedRowInvoice.invoice);
                                        }
                                      },
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
                                      onChange: (value) {})
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
                                      child: invoices.isNotEmpty
                                          ? ListView.builder(
                                              itemCount: invoices.length,
                                              itemBuilder: (context, i) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedRowInvoice =
                                                          invoices[i];
                                                      selectedTotalItemsPrice =
                                                          0;

                                                      selectedRowInvoice
                                                          .itemsInvoice
                                                          .forEach((element) {
                                                        selectedTotalItemsPrice +=
                                                            element.quantity *
                                                                element.price;
                                                      });
                                                    });
                                                  },
                                                  child: RowInvoiceTable(
                                                      selected:
                                                          selectedRowInvoice
                                                                      .invoice
                                                                      .id ==
                                                                  invoices[i]
                                                                      .invoice
                                                                      .id
                                                              ? true
                                                              : false,
                                                      client: invoices[i]
                                                          .invoice
                                                          .client
                                                          .businessName,
                                                      amount: 2000.0,
                                                      status: invoices[i]
                                                          .invoice
                                                          .paid
                                                          .toString()),
                                                );
                                              })
                                          : const SizedBox(),
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
                                         Text(
                                           selectedRowInvoice.invoice.client.businessName,
                                          style: const TextStyle(
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
                                            padding: EdgeInsets.symmetric(
                                                vertical: miniSpacer / 2,
                                                horizontal: appPadding),
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
                                                vertical: miniSpacer,
                                                horizontal: appPadding),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                     Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          "Amount due",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  smallFontSize *
                                                                      0.8),
                                                        ),
                                                        Text("$selectedTotalItemsPrice",
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ],
                                                    ),
                                                    Container(
                                                      decoration:  BoxDecoration(
                                                          color: selectedRowInvoice.invoice.paid? primary: Colors.amber,
                                                          borderRadius:
                                                              const BorderRadius.all(
                                                                  Radius.circular(
                                                                      smallFontSize))),
                                                      child:  Padding(
                                                        padding: const EdgeInsets.all(
                                                            miniSpacer / 2),
                                                        child: Text(
                                                          selectedRowInvoice.invoice.paid? "Paid": "Pending",
                                                          style: const TextStyle(
                                                            color: textWhite,
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
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          "Issued on",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  smallFontSize *
                                                                      0.8),
                                                        ),
                                                        Text(
                                                            selectedRowInvoice
                                                                .invoice
                                                                .currentDate,
                                                            style: const TextStyle(
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
                                                        const Text(
                                                          "Due on",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  smallFontSize *
                                                                      0.8),
                                                        ),
                                                        Text(
                                                            selectedRowInvoice
                                                                .invoice
                                                                .dueDate,
                                                            style: const TextStyle(
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
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: miniSpacer,
                                                horizontal: appPadding),
                                            child: Column(
                                              children: [
                                                // CustomTypeItem(),
                                                invoices.isNotEmpty
                                                    ? SingleChildScrollView(
                                                        child: ListView.builder(
                                                            shrinkWrap: true,
                                                            itemCount:
                                                                selectedRowInvoice
                                                                    .itemsInvoice
                                                                    .length,
                                                            itemBuilder:
                                                                (context, i) {
                                                              return CustomItem(
                                                                  id: selectedRowInvoice
                                                                      .itemsInvoice[
                                                                          i]
                                                                      .id,
                                                                  name: selectedRowInvoice
                                                                      .itemsInvoice[
                                                                          i]
                                                                      .name,
                                                                  quantity: selectedRowInvoice
                                                                      .itemsInvoice[
                                                                          i]
                                                                      .quantity,
                                                                  price: selectedRowInvoice
                                                                      .itemsInvoice[
                                                                          i]
                                                                      .price,
                                                                  itemType: selectedRowInvoice
                                                                      .itemsInvoice[
                                                                          i]
                                                                      .itemType);
                                                            }),
                                                      )
                                                    : const SizedBox(),
                                                CustomTotalItem(
                                                  total:
                                                      selectedTotalItemsPrice,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Padding(
                                          padding: EdgeInsets.all(appPadding),
                                          child: CustomButtom(
                                              title: "Mark as paid")))
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
