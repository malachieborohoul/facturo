import 'package:facturo/common/widgets/custom_header.dart';
import 'package:facturo/common/widgets/custom_textfield.dart';
import 'package:facturo/common/widgets/error_field_modal.dart';
import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/global.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/material.dart';

class AddItemTypeScreen extends StatefulWidget {
  static const routeName = '/add-item-type';

  const AddItemTypeScreen({super.key});

  @override
  State<AddItemTypeScreen> createState() => _AddItemTypeScreenState();
}

class _AddItemTypeScreenState extends State<AddItemTypeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

    @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

    void addItemType() {
    inventoryService.addItemType(
        context: context,
        name: nameController.text,
        description: descriptionController.text,
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
                Navigator.pop(context);
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
                                        arguments: "Company Name");
                                  } else {
                                    addItemType();
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
                        const CustomHeader(title: "Add Item Type"),
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
                                      controller: descriptionController,
                                      hintText: "Description",
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
