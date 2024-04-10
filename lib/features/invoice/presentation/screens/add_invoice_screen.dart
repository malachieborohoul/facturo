import 'package:facturo/features/invoice/presentation/widgets/add_button.dart';
import 'package:facturo/features/invoice/presentation/widgets/add_header.dart';
import 'package:facturo/features/invoice/presentation/widgets/add_row_item.dart';
import 'package:facturo/features/invoice/presentation/widgets/add_row_total_item.dart';
import 'package:facturo/features/invoice/presentation/widgets/add_sub_header.dart';
import 'package:facturo/core/constants/color.dart';
import 'package:facturo/core/constants/padding.dart';
import 'package:facturo/core/constants/size.dart';
import 'package:facturo/features/client/screens/select_client_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Add Invoice",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.print_outlined,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove_red_eye_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.check)),
            const SizedBox(
              width: appPadding,
            )
          ],
        ),
        body: Column(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: smallFontSize,
                  ),
                  const AddHeader(title: "INVOICE INFORMATION"),
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
                                title: "Invoice Date",
                              ),
                              AddSubHeader(title: "Due Date"),
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
                        padding: EdgeInsets.all(appPadding),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SelectClientScreen.routeName);
                            },
                            child: AddButton(title: "Add Client"))),
                  ),
                  const SizedBox(
                    height: smallFontSize,
                  ),
                  SizedBox(
                    width: size.width * 0.7,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AddHeader(title: "ITEMS"),
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
                    child: const Padding(
                      padding: EdgeInsets.all(appPadding),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AddSubHeader(title: "Name"),
                              AddSubHeader(title: "Quantity"),
                              AddSubHeader(title: "Price"),
                            ],
                          ),
                          // RemoveItemButton(title: "Battery"),
                          SizedBox(
                            height: smallFontSize,
                          ),
                          AddRowItem(name: "Battery", quantity: 1, price: 1000),
                          AddRowItem(
                              name: "Battery 23", quantity: 3, price: 2000),
                          Divider(
                            thickness: 0.2,
                          ),
                          SizedBox(
                            height: smallFontSize,
                          ),
                          Center(
                            child: AddButton(title: "Add Item"),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: smallFontSize,
                  ),
                  const AddHeader(title: "SUMMARY"),
                  const SizedBox(
                    height: smallFontSize / 2,
                  ),
                  const AddRowTotalItem(total: 3000)
                ],
              ),
            )
          ],
        ));
  }
}