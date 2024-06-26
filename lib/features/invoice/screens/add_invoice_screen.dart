import 'package:facturo/common/widgets/error_field_modal.dart';
import 'package:facturo/constants/global.dart';
import 'package:facturo/features/client/widgets/client_card.dart';
import 'package:facturo/features/inventory/screens/select_item_type_screen.dart';
import 'package:facturo/features/invoice/widgets/add_button.dart';
import 'package:facturo/features/invoice/widgets/add_header.dart';
import 'package:facturo/features/invoice/widgets/add_row_item.dart';
import 'package:facturo/features/invoice/widgets/add_row_total_item.dart';
import 'package:facturo/features/invoice/widgets/add_sub_header.dart';
import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:facturo/features/client/screens/select_client_screen.dart';
import 'package:facturo/providers/client_provider.dart';
import 'package:facturo/providers/item_invoice_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddInvoiceScreen extends StatefulWidget {
  static const routeName = '/add-invoce';

  const AddInvoiceScreen({super.key});

  @override
  State<AddInvoiceScreen> createState() => _AddInvoiceScreenState();
}

class _AddInvoiceScreenState extends State<AddInvoiceScreen> {
  TextEditingController issueDateController = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  TextEditingController dueDateController = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()));

  List<TextEditingController> _quantityController = [];
  //Variable to verify if quantity of each item is added
  bool isQuantityAdded = true;

  @override
  void dispose() {
    issueDateController.dispose();
    dueDateController.dispose();
    for (var element in _quantityController) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final clientProvider = Provider.of<ClientProvider>(context).client;
    // final itemProvider = Provider.of<ItemProvider>(context).items;
    final itemInvoiceProvider =
        Provider.of<ItemInvoiceProvider>(context).itemsInvoice;

    //Every time build is called set is to true
    isQuantityAdded = true;
    itemInvoiceProvider.forEach((item) {
      _quantityController.add(TextEditingController());
    });

    //Every time build is called verify if a quantity item has been added if not it is false
    itemInvoiceProvider.forEach((element) {
      if (element.quantity == 0) {
        isQuantityAdded = false;
      }
    });
    final size = MediaQuery.of(context).size;

    void addInvoice() {
      invoiceService.addInvoice(
          context: context,
          number: "INV",
          currentDate: issueDateController.text,
          dueDate: dueDateController.text,
          client: clientProvider,
          paid: true,
          itemInvoiceProvider: itemInvoiceProvider,
          onSuccess: () {
            Navigator.pop(context, true);
          },
          onFailed: () {});
    }

    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: background,
          centerTitle: true,
          title: const Text(
            "Ajouter une facture",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            // IconButton(
            //     onPressed: () {},
            //     icon: const Icon(
            //       Icons.print_outlined,
            //     )),
            // IconButton(
            //     onPressed: () {},
            //     icon: const Icon(Icons.remove_red_eye_outlined)),
            IconButton(
                tooltip: "Ajouter",
                onPressed: () {
                  if (itemInvoiceProvider.isNotEmpty &&
                      clientProvider.businessName.isNotEmpty &&
                      isQuantityAdded) {
                    addInvoice();
                  } else {
                    Navigator.pushNamed(context, ErrorFieldModal.routeName,
                        arguments: "champs vides");
                  }
                },
                icon: const Icon(Icons.check)),
            const SizedBox(
              width: appPadding,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: smallFontSize,
                    ),
                    const AddHeader(title: "INFORMATION DE LA FACTURE"),
                    const SizedBox(
                      height: smallFontSize / 2,
                    ),
                    Container(
                      width: size.width * 0.7,
                      decoration: const BoxDecoration(
                          color: textWhite,
                          borderRadius:
                              BorderRadius.all(Radius.circular(smallFontSize))),
                      child: Padding(
                        padding: const EdgeInsets.all(appPadding),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                AddSubHeader(
                                  title: "Date de création",
                                ),
                                AddSubHeader(title: "Date d'échance"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: TextField(
                                      style: const TextStyle(
                                          fontSize: smallFontSize * 0.8,
                                          fontWeight: FontWeight.bold),
                                      controller:
                                          issueDateController, //editing controller of this TextField
                                      decoration: const InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        //icon of text field
                                      ),
                                      readOnly:
                                          true, // when true user cannot edit text
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime
                                                    .now(), //get today's date
                                                firstDate: DateTime(
                                                    2000), //DateTime.now() - not to allow to choose before today.
                                                lastDate: DateTime(2101));

                                        if (pickedDate != null) {
                                          if (kDebugMode) {
                                            print(pickedDate);
                                          } //get the picked date in the format => 2022-07-04 00:00:00.000
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd').format(
                                                  pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                          if (kDebugMode) {
                                            print(formattedDate);
                                          } //formatted date output using intl package =>  2022-07-04
                                          //You can format date as per your need

                                          setState(() {
                                            issueDateController.text =
                                                formattedDate; //set foratted date to TextField value.
                                          });
                                        } else {
                                          if (kDebugMode) {
                                            print("Date is not selected");
                                          }
                                        }
                                      }),
                                ),
                                Expanded(
                                  child: TextField(
                                      style: const TextStyle(
                                          fontSize: smallFontSize * 0.8,
                                          fontWeight: FontWeight.bold),
                                      controller:
                                          dueDateController, //editing controller of this TextField
                                      decoration: const InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        //icon of text field
                                      ),
                                      readOnly:
                                          true, // when true user cannot edit text
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime
                                                    .now(), //get today's date
                                                firstDate: DateTime(
                                                    2000), //DateTime.now() - not to allow to choose before today.
                                                lastDate: DateTime(2101));

                                        if (pickedDate != null) {
                                          if (kDebugMode) {
                                            print(pickedDate);
                                          } //get the picked date in the format => 2022-07-04 00:00:00.000
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd').format(
                                                  pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                          if (kDebugMode) {
                                            print(formattedDate);
                                          } //formatted date output using intl package =>  2022-07-04
                                          //You can format date as per your need

                                          setState(() {
                                            dueDateController.text =
                                                formattedDate; //set foratted date to TextField value.
                                          });
                                        } else {
                                          if (kDebugMode) {
                                            print("Date is not selected");
                                          }
                                        }
                                      }),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: smallFontSize,
                    ),
                    const AddHeader(title: "CLIENT"),
                    const SizedBox(
                      height: smallFontSize / 2,
                    ),
                    Container(
                      width: size.width * 0.7,
                      decoration: const BoxDecoration(
                          color: textWhite,
                          borderRadius:
                              BorderRadius.all(Radius.circular(smallFontSize))),
                      child: Padding(
                          padding: const EdgeInsets.all(appPadding),
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, SelectClientScreen.routeName,
                                    arguments: false);
                              },
                              child: clientProvider.businessName.isEmpty
                                  ? const AddButton(title: "Ajouter un Client")
                                  : ClientCard(
                                      client: clientProvider,
                                      onSuccessDelete: () {},
                                      onSuccessEdit: () {},
                                      isActionButtons: false,
                                    ))),
                    ),
                    const SizedBox(
                      height: smallFontSize,
                    ),
                    SizedBox(
                      width: size.width * 0.7,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AddHeader(title: "ARTICLES"),
                          // AddButton(title: "Add Category Item")
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: smallFontSize / 2,
                    ),
                    Container(
                      width: size.width * 0.7,
                      decoration: const BoxDecoration(
                          color: textWhite,
                          borderRadius:
                              BorderRadius.all(Radius.circular(smallFontSize))),
                      child: Padding(
                        padding: const EdgeInsets.all(appPadding),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AddSubHeader(title: "Nom"),
                                AddSubHeader(title: "Quantité"),
                                AddSubHeader(title: "Prix"),
                              ],
                            ),
                            // RemoveItemButton(title: "Battery"),
                            const SizedBox(
                              height: smallFontSize,
                            ),
                            itemInvoiceProvider.isNotEmpty
                                ? ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: itemInvoiceProvider.length,
                                    itemBuilder: (context, i) {
                                      return InkWell(
                                        onTap: () {
                                          Provider.of<ItemInvoiceProvider>(
                                                  context,
                                                  listen: false)
                                              .removeItem(
                                                  itemInvoiceProvider[i],
                                                  int.parse(
                                                      _quantityController[i]
                                                          .text));
                                        },
                                        child: AddRowItem(
                                          itemInvoice: itemInvoiceProvider[i],
                                          quantityController:
                                              _quantityController[i],
                                        ),
                                      );
                                    })
                                : const SizedBox(),

                            const Divider(
                              thickness: 0.2,
                            ),
                            const SizedBox(
                              height: smallFontSize,
                            ),
                            Center(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, SelectItemTypeScreen.routeName,
                                        arguments: false);
                                  },
                                  child: const AddButton(
                                      title: "Ajouter un article")),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: smallFontSize,
                    ),
                    const AddHeader(title: "RESUME"),
                    const SizedBox(
                      height: smallFontSize / 2,
                    ),
                    const AddRowTotalItem(total: 3000),
                    const SizedBox(
                      height: smallFontSize,
                    ),
                    // const AddHeader(title: "Payment status"),
                    // const SizedBox(
                    //   height: smallFontSize / 2,
                    // ),
                    // const AddRowPaidInvoice()
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
