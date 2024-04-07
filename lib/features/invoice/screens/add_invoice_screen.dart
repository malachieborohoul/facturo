import 'package:facturo/common/widgets/add_button.dart';
import 'package:facturo/common/widgets/add_header.dart';
import 'package:facturo/common/widgets/add_sub_header.dart';
import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                              AddSubHeader(title: "Invoice Date",),
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
                                        print(
                                            pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                        String formattedDate =
                                            DateFormat('yyyy-MM-dd').format(
                                                pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                        print(
                                            formattedDate); //formatted date output using intl package =>  2022-07-04
                                        //You can format date as per your need
                                                                
                                        setState(() {
                                          issueDateController.text =
                                              formattedDate; //set foratted date to TextField value.
                                        });
                                      } else {
                                        print("Date is not selected");
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
                                        print(
                                            pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                        String formattedDate =
                                            DateFormat('yyyy-MM-dd').format(
                                                pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                        print(
                                            formattedDate); //formatted date output using intl package =>  2022-07-04
                                        //You can format date as per your need
                                                                
                                        setState(() {
                                          dueDateController.text =
                                              formattedDate; //set foratted date to TextField value.
                                        });
                                      } else {
                                        print("Date is not selected");
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
                    child: const Padding(
                        padding: EdgeInsets.all(appPadding),
                        child: AddButton(title: "Add Client")),
                  ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AddSubHeader(title: "Name"),
                              AddSubHeader(title: "Quantity"),
                              AddSubHeader(title: "Price"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
