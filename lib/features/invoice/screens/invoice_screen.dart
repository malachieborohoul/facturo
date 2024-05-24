import 'package:facturo/common/widgets/confirmation_modal.dart';
import 'package:facturo/common/widgets/custom_item.dart';
import 'package:facturo/common/widgets/custom_not_found.dart';
import 'package:facturo/common/widgets/custom_searchbar.dart';
import 'package:facturo/common/widgets/custom_total_item.dart';
import 'package:facturo/common/widgets/dashboard_menu.dart';
import 'package:facturo/constants/global.dart';
import 'package:facturo/features/client/screens/select_client_screen.dart';
import 'package:facturo/features/inventory/screens/inventory_screen.dart';
import 'package:facturo/features/inventory/screens/select_item_screen.dart';
import 'package:facturo/features/inventory/screens/select_item_type_screen.dart';
import 'package:facturo/features/invoice/screens/edit_invoice_screen.dart';
import 'package:facturo/features/invoice/services/pdf_invoice_service.dart';
import 'package:facturo/features/invoice/services/pdf_service.dart';
import 'package:facturo/features/invoice/widgets/header_invoice_table.dart';
import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:facturo/features/invoice/screens/add_invoice_screen.dart';
import 'package:facturo/features/invoice/widgets/row_invoice_table.dart';
import 'package:facturo/models/client.dart';
import 'package:facturo/models/invoice.dart';
import 'package:facturo/models/invoice_item.dart';
import 'package:facturo/models/invoice_with_items.dart';
import 'package:facturo/providers/client_provider.dart';
import 'package:facturo/providers/item_invoice_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

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

  List<InvoiceWithItems> searchResults = [];
  bool isSeaching = false;

  @override
  void initState() {
    getAllInvoices();

    invoiceItems.keys.forEach((invoiceItemKey) {
      var invoiceItem = invoiceItems.get(invoiceItemKey) as InvoiceItem;

      if (kDebugMode) {
        print(invoiceItem.invoice.id);
      }
      selectedTotalItemsPrice = 0;
      if (invoices.isNotEmpty) {
        selectedRowInvoice.itemsInvoice.forEach((element) {
          selectedTotalItemsPrice += element.quantity * element.price;
        });
      }
    });
    super.initState();
  }

  late List<InvoiceWithItems> invoices;

  void getAllInvoices() {
    invoices = invoiceService.getAllInvoices(context);
    if (invoices.isNotEmpty) {
      selectedRowInvoice = invoices.first;
      // print(selectedRowInvoice.itemsInvoice.toString());
    } else {}

    setState(() {});
  }

  void deleteInvoice(Invoice invoice) {
    invoiceService.deleteInvoice(
        context: context,
        invoice: invoice,
        onSuccess: () {
          searchController.text = "";
          isSeaching = false;
          getAllInvoices();
        },
        onFailed: () {});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final clientProvider = Provider.of<ClientProvider>(context);
    final itemInvoiceProvider =
        Provider.of<ItemInvoiceProvider>(context).itemsInvoice;

    void searchInvoices(String searchTerm) {
      searchResults.clear();

      for (var invoice in invoices) {
        if (invoice.invoice.client.businessName
            .toLowerCase()
            .contains(searchTerm.toLowerCase().trim())) {
          searchResults.add(invoice);
        }
      }

      setState(() {
        // When search starts isSeaching to perform conditions on displaying the
        isSeaching = true;
      });
    }

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
                                "Factures",
                                style: TextStyle(
                                    fontSize: headingFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      tooltip: "Clients",
                                      onPressed: () {
                                        Navigator.pushNamed(context,
                                            SelectClientScreen.routeName,
                                            arguments: true);
                                      },
                                      icon: const Icon(
                                        Icons.people_alt_outlined,
                                      )),
                                  IconButton(
                                      tooltip: "Articles",
                                      onPressed: () {
                                        Navigator.pushNamed(context,
                                            SelectItemTypeScreen.routeName,
                                            arguments: true);
                                      },
                                      icon: const Icon(
                                          Icons.inventory_2_outlined)),
                                  IconButton(
                                      tooltip: "Ajouter une facture",
                                      onPressed: () async {
                                        Provider.of<ClientProvider>(context,
                                                listen: false)
                                            .setClient(Client(
                                                id: 0,
                                                businessName: "",
                                                name: "",
                                                address: ""));

                                        itemInvoiceProvider.clear();

                                        final result =
                                            await Navigator.pushNamed(context,
                                                AddInvoiceScreen.routeName);

                                        if (result == true) {
                                          itemInvoiceProvider.clear();
                                          clientProvider.setClient(Client(
                                              id: 0,
                                              businessName: "",
                                              name: "",
                                              address: ""));

                                          getAllInvoices();

                                          invoiceItems.keys
                                              .forEach((invoiceItemKey) {
                                            var invoiceItem =
                                                invoiceItems.get(invoiceItemKey)
                                                    as InvoiceItem;

                                            if (kDebugMode) {
                                              print(invoiceItem.invoice.id);
                                            }
                                            selectedTotalItemsPrice = 0;
                                            if (invoices.isNotEmpty) {
                                              selectedRowInvoice.itemsInvoice
                                                  .forEach((element) {
                                                selectedTotalItemsPrice +=
                                                    element.quantity *
                                                        element.price;
                                              });
                                            }
                                          });
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                      )),
                                  const SizedBox(
                                    width: miniSpacer,
                                  ),
                                  IconButton(
                                      tooltip: "Supprimer une facture",
                                      onPressed: invoices.isNotEmpty
                                          ? () async {
                                              var result =
                                                  await Navigator.pushNamed(
                                                      context,
                                                      ConfirmationModal
                                                          .routeName,
                                                      arguments:
                                                          "Voulez-vous supprimer cette facture ?");
                                              if (result == true) {
                                                // deleteItem(items[i]);
                                                deleteInvoice(
                                                    selectedRowInvoice.invoice);
                                              }
                                            }
                                          : null,
                                      icon: const Icon(Icons.delete_outlined)),
                                  const SizedBox(
                                    width: miniSpacer,
                                  ),
                                  IconButton(
                                      tooltip: "Modifier une facture",
                                      onPressed: invoices.isNotEmpty
                                          ? () async {
                                              itemInvoiceProvider.clear();

                                              Provider.of<ClientProvider>(
                                                      context,
                                                      listen: false)
                                                  .setClient(selectedRowInvoice
                                                      .invoice.client);
                                              selectedRowInvoice.itemsInvoice
                                                  .forEach((element) {
                                                itemInvoiceProvider
                                                    .add(element);
                                              });
                                              final result =
                                                  await Navigator.pushNamed(
                                                      context,
                                                      EditInvoiceScreen
                                                          .routeName,
                                                      arguments:
                                                          selectedRowInvoice);

                                              if (result == true) {
                                                itemInvoiceProvider.clear();
                                                clientProvider.setClient(Client(
                                                    id: 0,
                                                    businessName: "",
                                                    name: "",
                                                    address: ""));

                                                getAllInvoices();
                                              }
                                            }
                                          : null,
                                      icon: const Icon(Icons.edit_outlined)),
                                  const SizedBox(
                                    width: miniSpacer,
                                  ),
                                  IconButton(
                                      tooltip: "Convertir la facture en pdf",
                                      onPressed: invoices.isNotEmpty
                                          ? () async {
                                              final pdfFile =
                                                  await PdfInvoiceService
                                                      .generate(
                                                          selectedRowInvoice);

                                              PdfService.openFile(pdfFile);
                                            }
                                          : null,
                                      icon: const Icon(Icons.print_outlined)),
                                  const SizedBox(
                                    width: miniSpacer,
                                  ),
                                  CustomSearchbar(
                                      controller: searchController,
                                      hintText: "Rechercher ",
                                      onChange: (value) {
                                        if (value.isEmpty) {
                                          getAllInvoices();
                                        }

                                        searchInvoices(value);
                                      })
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
                                        child: isSeaching == true
                                            ? searchResults.isNotEmpty
                                                ? ListView.builder(
                                                    itemCount:
                                                        searchResults.length,
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
                                                                .forEach(
                                                                    (element) {
                                                              selectedTotalItemsPrice +=
                                                                  element.quantity *
                                                                      element
                                                                          .price;
                                                            });
                                                          });
                                                        },
                                                        child: RowInvoiceTable(
                                                            selected: selectedRowInvoice
                                                                        .invoice
                                                                        .id ==
                                                                    searchResults[
                                                                            i]
                                                                        .invoice
                                                                        .id
                                                                ? true
                                                                : false,
                                                            client:
                                                                searchResults[i]
                                                                    .invoice
                                                                    .client
                                                                    .businessName,
                                                            amount: 2000.0,
                                                            status:
                                                                searchResults[i]
                                                                    .invoice
                                                                    .paid
                                                                    .toString(),
                                                            invoice:
                                                                searchResults[i]
                                                                    .invoice,
                                                            number: invoices[i]
                                                                .invoice
                                                                .number
                                                                .toString()),
                                                      );
                                                    })
                                                : const Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Center(
                                                        child: CustomNotFound(
                                                            message: "facture"),
                                                      ),
                                                    ],
                                                  )
                                            : invoices.isNotEmpty
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
                                                                .forEach(
                                                                    (element) {
                                                              selectedTotalItemsPrice +=
                                                                  element.quantity *
                                                                      element
                                                                          .price;
                                                            });
                                                          });
                                                        },
                                                        child: RowInvoiceTable(
                                                          selected:
                                                              selectedRowInvoice
                                                                          .invoice
                                                                          .id ==
                                                                      invoices[
                                                                              i]
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
                                                              .toString(),
                                                          invoice:
                                                              selectedRowInvoice
                                                                  .invoice,
                                                          number: invoices[i]
                                                              .invoice
                                                              .number
                                                              .toString(),
                                                        ),
                                                      );
                                                    })
                                                : const Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Center(
                                                        child: CustomNotFound(
                                                            message: "facture"),
                                                      ),
                                                    ],
                                                  ))
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
                                          invoices.isNotEmpty
                                              ? selectedRowInvoice
                                                  .invoice.client.businessName
                                              : "Client",
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
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: miniSpacer / 2,
                                                horizontal: appPadding),
                                            child: Text(invoices.isNotEmpty
                                                ? selectedRowInvoice
                                                    .invoice.number
                                                : "INV"),
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
                                                          "Montant",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  smallFontSize *
                                                                      0.8),
                                                        ),
                                                        invoices.isNotEmpty
                                                            ? Text(
                                                                "$selectedTotalItemsPrice",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))
                                                            : const Text("0.0"),
                                                      ],
                                                    ),
                                                    // Container(
                                                    //   decoration: BoxDecoration(
                                                    //       color:
                                                    //           selectedRowInvoice
                                                    //                   .invoice
                                                    //                   .paid
                                                    //               ? primary
                                                    //               : Colors
                                                    //                   .amber,
                                                    //       borderRadius:
                                                    //           const BorderRadius
                                                    //               .all(
                                                    //               Radius.circular(
                                                    //                   smallFontSize))),
                                                    //   child: Padding(
                                                    //     padding:
                                                    //         const EdgeInsets
                                                    //             .all(
                                                    //             miniSpacer / 2),
                                                    //     child: Text(
                                                    //       selectedRowInvoice
                                                    //               .invoice.paid
                                                    //           ? "Paid"
                                                    //           : "Pending",
                                                    //       style:
                                                    //           const TextStyle(
                                                    //         color: textWhite,
                                                    //         fontSize:
                                                    //             smallFontSize *
                                                    //                 0.8,
                                                    //       ),
                                                    //     ),
                                                    //   ),
                                                    // )
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
                                                          "Création",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  smallFontSize *
                                                                      0.8),
                                                        ),
                                                        Text(
                                                            invoices.isNotEmpty
                                                                ? selectedRowInvoice
                                                                    .invoice
                                                                    .currentDate
                                                                : "Date de création",
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
                                                          "Echeance",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  smallFontSize *
                                                                      0.8),
                                                        ),
                                                        Text(
                                                            invoices.isNotEmpty
                                                                ? selectedRowInvoice
                                                                    .invoice
                                                                    .dueDate
                                                                : "Date d'écheance",
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
                                          "Articles",
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
                                                  total: invoices.isNotEmpty
                                                      ? selectedTotalItemsPrice
                                                      : 0.0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // const Positioned(
                                  //     left: 0,
                                  //     right: 0,
                                  //     bottom: 0,
                                  //     child: Padding(
                                  //         padding: EdgeInsets.all(appPadding),
                                  //         child: CustomButtom(
                                  //             title: "Mark as paid")))
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
