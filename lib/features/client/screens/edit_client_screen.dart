import 'package:facturo/common/widgets/custom_header.dart';
import 'package:facturo/common/widgets/custom_textfield.dart';
import 'package:facturo/common/widgets/error_field_modal.dart';
import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/global.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:facturo/models/client.dart';
import 'package:flutter/material.dart';

class EditClientScreen extends StatefulWidget {
  static const routeName = '/edit-client';

  const EditClientScreen({super.key, required this.client});
  final Client client;

  @override
  State<EditClientScreen> createState() => _EditClientScreenState();
}

class _EditClientScreenState extends State<EditClientScreen> {
  TextEditingController businessNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool isLoading = false;



  @override
  void dispose() {
    businessNameController.dispose();
    nameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void editClient() {
    clientService.editClient(
        context: context,
        businessName: businessNameController.text,
        name: nameController.text,
        address: addressController.text,
        client: widget.client,
        onSuccess: () {
          // Navigator.pushNamed(context, SuccessFieldModal.routeName,
          //     arguments: "Client added");

          Navigator.pop(context, true);
        },
        onFailed: () {}, );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

     if (isLoading) {
      businessNameController.text = businessNameController.text.trim();
      nameController.text = nameController.text.trim();
      addressController.text = addressController.text.trim();
    } else {
      businessNameController.text = widget.client.businessName;
      nameController.text = widget.client.name;
      addressController.text = widget.client.address;
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
                                  if (businessNameController.text.isEmpty) {
                                    Navigator.pushNamed(
                                        context, ErrorFieldModal.routeName,
                                        arguments: "Company Name");
                                  } else {
                                    editClient();
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
                        const CustomHeader(title: "Edit Client"),
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
                                      hintText: "Company Name",
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
                                      controller: addressController,
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
