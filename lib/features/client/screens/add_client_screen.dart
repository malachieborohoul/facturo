import 'package:facturo/common/widgets/custom_header.dart';
import 'package:facturo/common/widgets/custom_textfield.dart';
import 'package:facturo/common/widgets/error_field_modal.dart';
import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/global.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/material.dart';

class AddClientScreen extends StatefulWidget {
  static const routeName = '/add-client';

  const AddClientScreen({super.key});

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  TextEditingController businessNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void dispose() {
    businessNameController.dispose();
    nameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void addClient() {
    clientService.addClient(
        context: context,
        businessName: businessNameController.text,
        name: nameController.text,
        address: addressController.text,
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
                                  "Annuler",
                                  style: TextStyle(color: primary),
                                )),
                            InkWell(
                                onTap: () {
                                  if (businessNameController.text.isEmpty) {
                                    Navigator.pushNamed(
                                        context, ErrorFieldModal.routeName,
                                        arguments: "Nom de l'entreprise");
                                  } else {
                                    addClient();
                                  }
                                },
                                child: const Text(
                                  "Fait",
                                  style: TextStyle(color: primary),
                                )),
                          ],
                        ),
                        const CustomHeader(title: "Ajouter Client"),
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
                                      controller: businessNameController,
                                      hintText: "Nom de l'entreprise",
                                      onSuccess: () {}, onChange: (String param) {  },),
                                  const SizedBox(
                                    height: smallFontSize,
                                  ),
                                  CustomTextfield(
                                      controller: nameController,
                                      hintText: "Nom",
                                      onSuccess: () {}, onChange: (String param) {  },),
                                  const SizedBox(
                                    height: smallFontSize,
                                  ),
                                  CustomTextfield(
                                      controller: addressController,
                                      hintText: "Adresse",
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
