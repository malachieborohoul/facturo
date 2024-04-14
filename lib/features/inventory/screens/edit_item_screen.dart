import 'package:facturo/common/widgets/custom_header.dart';
import 'package:facturo/common/widgets/custom_textfield.dart';
import 'package:facturo/common/widgets/error_field_modal.dart';
import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/global.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:facturo/models/item.dart';
import 'package:facturo/models/item_type.dart';
import 'package:flutter/material.dart';

class EditItemScreen extends StatefulWidget {
  static const routeName = '/edit-item';

  const EditItemScreen({super.key, required this.itemType, required this.item});
  final ItemType itemType;
  final Item item;

  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    quantityController.dispose();
    priceController.dispose();
    super.dispose();
  }

  bool isLoading = false;

  void editItem() {
    inventoryService.editItem(
      context: context,
      name: nameController.text,
      quantity: int.parse(quantityController.text),
      price: double.parse(priceController.text),
      itemType: widget.itemType,
      item: widget.item,
      onSuccess: () {
        // Navigator.pushNamed(context, SuccessFieldModal.routeName,
        //     arguments: "Client added");

        Navigator.pop(context, true);
      },
      onFailed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (isLoading) {
      nameController.text = nameController.text.trim();
      quantityController.text = quantityController.text.trim();
      priceController.text = priceController.text.trim();
    } else {
      nameController.text = widget.item.name;
      quantityController.text = widget.item.quantity.toString();
      priceController.text = widget.item.price.toString();
    }

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
                                  if (nameController.text.isEmpty) {
                                    Navigator.pushNamed(
                                        context, ErrorFieldModal.routeName,
                                        arguments: "Name");
                                  } else {
                                    editItem();
                                  }
                                },
                                child: const Text(
                                  "Done",
                                  style: TextStyle(color: primary),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: smallFontSize,
                        ),
                        const CustomHeader(title: "Edit Item "),
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
                                      onSuccess: () {}),
                                  const SizedBox(
                                    height: smallFontSize,
                                  ),
                                  CustomTextfield(
                                      controller: quantityController,
                                      hintText: "Quantity",
                                      textInputType: TextInputType.number,
                                      onSuccess: () {}),
                                  const SizedBox(
                                    height: smallFontSize,
                                  ),
                                  CustomTextfield(
                                      controller: priceController,
                                      textInputType: TextInputType.number,
                                      hintText: "Price",
                                      onSuccess: () {}),
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
