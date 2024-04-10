import 'package:facturo/common/widgets/client/client_card.dart';
import 'package:facturo/common/widgets/custom_header.dart';
import 'package:facturo/common/widgets/custom_searchbar.dart';
import 'package:facturo/common/widgets/custom_textfield.dart';
import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/material.dart';

class AddItemScreen extends StatefulWidget {
  static const routeName = '/add-item';

  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController nameController = TextEditingController();

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
                                  Navigator.pop(context);
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
                                      hintText: "Business Name",
                                      onSuccess: () {}),
                                  const SizedBox(
                                    height: smallFontSize,
                                  ),
                                  CustomTextfield(
                                      controller: nameController,
                                      hintText: "Name",
                                      onSuccess: () {}),
                                  const SizedBox(
                                    height: smallFontSize,
                                  ),
                                  CustomTextfield(
                                      controller: nameController,
                                      hintText: "Address",
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
