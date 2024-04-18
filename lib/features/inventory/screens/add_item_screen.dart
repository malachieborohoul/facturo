import 'package:facturo/common/widgets/custom_header.dart';
import 'package:facturo/common/widgets/custom_textfield.dart';
import 'package:facturo/common/widgets/error_field_modal.dart';
import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/global.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:facturo/models/item_type.dart';
import 'package:flutter/material.dart';

class AddItemScreen extends StatefulWidget {
  static const routeName = '/add-item';

  const AddItemScreen({super.key, required this.itemType});
  final ItemType itemType;

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  void addItem() {
    inventoryService.addItem(
        context: context,
        name: nameController.text,
        price: double.parse(priceController.text),
        itemType: widget.itemType,
        onSuccess: () {
          // Navigator.pushNamed(context, SuccessFieldModal.routeName,
          //     arguments: "Client added");

          Navigator.pop(context, true);
        },
        onFailed: () {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned.fill(
                child: GestureDetector(
              onTap: () {
                // Navigator.pop(context);
              },
              child: Container(
                color: Colors.black26,
              ),
            )),
            Positioned(
                top: size.height / 2 - (size.height * 0.8) / 2,
                right: size.width / 2 - (size.width * 0.4) / 2,
                child: Container(
                  height: size.height * 0.8,
                  width: size.width * 0.4,
                  decoration: const BoxDecoration(
                      color: background,
                      borderRadius:
                          BorderRadius.all(Radius.circular(smallFontSize))),
                  child: Padding(
                    padding: const EdgeInsets.all(appPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(color: primary),
                                )),
                            InkWell(
                                onTap: () {
                                  if (nameController.text.isEmpty ||
                                      
                                      priceController.text.isEmpty) {
                                    Navigator.pushNamed(
                                        context, ErrorFieldModal.routeName,
                                        arguments: "empty fields");
                                  } else {
                                    addItem();
                                  }
                                },
                                child: const Text(
                                  "Done",
                                  style: TextStyle(color: primary),
                                )),
                          ],
                        ),
                        const CustomHeader(title: "Add Item"),
                        const SizedBox(
                          height: smallFontSize,
                        ),
                        Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(smallFontSize))),
                            child: Padding(
                              padding: const EdgeInsets.all(appPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextfield(
                                      controller: nameController,
                                      hintText: "Name",
                                      onSuccess: () {}, onChange: (String param) {  },),
                                
                                  const SizedBox(
                                    height: smallFontSize,
                                  ),
                                  CustomTextfield(
                                      controller: priceController,
                                      textInputType: TextInputType.number,
                                      hintText: "Price",
                                      onSuccess: () {}, onChange: (String param) {  },),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}
