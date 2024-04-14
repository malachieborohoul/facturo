import 'package:facturo/common/widgets/confirmation_modal.dart';
import 'package:facturo/common/widgets/custom_header.dart';
import 'package:facturo/common/widgets/custom_not_found.dart';
import 'package:facturo/common/widgets/custom_searchbar.dart';
import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/global.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:facturo/features/inventory/screens/add_item_screen.dart';
import 'package:facturo/features/inventory/screens/add_item_type_screen.dart';
import 'package:facturo/features/inventory/widgets/item_card.dart';
import 'package:facturo/models/item_type.dart';
import 'package:flutter/material.dart';

class SelectItemTypeScreen extends StatefulWidget {
  static const routeName = '/select-item-type';

  const SelectItemTypeScreen({super.key});

  @override
  State<SelectItemTypeScreen> createState() => _SelectItemTypeScreenState();
}

class _SelectItemTypeScreenState extends State<SelectItemTypeScreen> {
  TextEditingController searchController = TextEditingController();
  late List<ItemType> itemTypes;
  List<ItemType> searchResults = [];
  bool isSeaching = false;
  @override
  void initState() {
    super.initState();

    getAllItemTypes();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void getAllItemTypes() {
    itemTypes = inventoryService.getAllItemTypes(context);
    setState(() {});
  }

    void deleteItemType(ItemType itemType) {
    inventoryService.deleteItemType(
        context: context,
        itemType: itemType,
        onSuccess: () {
          searchController.text = "";
          isSeaching = false;
          getAllItemTypes();
        },
        onFailed: () {});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
      void searchItemTypes(String searchTerm) {
      searchResults.clear();

      for (var itemType in itemTypes) {
        if (itemType.name
            .toLowerCase()
            .contains(searchTerm.toLowerCase().trim())) {
          searchResults.add(itemType);
        }
      }

      setState(() {
        // When search starts isSeaching to perform conditions on displaying the
        isSeaching = true;
      });
    }

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
                            IconButton(
                                onPressed: () async{
                                 final result= await Navigator.pushNamed(
                                      context, AddItemTypeScreen.routeName);
                                  if (result == true) {
                                    getAllItemTypes();
                                  }
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: primary,
                                ))
                          ],
                        ),
                        const CustomHeader(title: "Item Types"),  
                        const SizedBox(
                          height: smallFontSize,
                        ),
                        CustomSearchbar(
                            controller: searchController,
                            hintText: "Search",
                            width: double.infinity,
                            height: 40,
                            onChange: (value) {
                                if (value.isEmpty) {
                                getAllItemTypes();
                              }

                              searchItemTypes(value);
                            }),
                        const SizedBox(
                          height: smallFontSize,
                        ),
                              Expanded(
                            child: isSeaching == true
                                ? searchResults.isNotEmpty
                                    ? ListView.builder(
                                        itemCount: searchResults.length,
                                        itemBuilder: (context, i) {
                                          return InkWell(
                                            onTap: () {
                                              // Provider.of<ClientProvider>(
                                              //         context,
                                              //         listen: false)
                                              //     .setClient(searchResults[i]);
                                              // Navigator.pop(context);
                                            },
                                            child: ItemCard(
                                              itemType: searchResults[i],
                                              onSuccessEdit: () {
                                                getAllItemTypes();
                                              },
                                              onSuccessDelete: () async {
                                                var result =
                                                    await Navigator.pushNamed(
                                                        context,
                                                        ConfirmationModal
                                                            .routeName,
                                                        arguments:
                                                            "Do you want to delete this client");
                                                if (result == true) {
                                                  deleteItemType(
                                                      searchResults[i]);
                                                }
                                              },
                                            ),
                                          );
                                        })
                                    : const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: CustomNotFound(
                                                message: "item type"),
                                          ),
                                        ],
                                      )
                                : itemTypes.isNotEmpty
                                    ? ListView.builder(
                                        itemCount: itemTypes.length,
                                        itemBuilder: (context, i) {
                                          return InkWell(
                                            onTap: () {
                                              // Provider.of<ClientProvider>(
                                              //         context,
                                              //         listen: false)
                                              //     .setClient(clients[i]);
                                              // Navigator.pop(context);
                                            },
                                            child: ItemCard(
                                              itemType: itemTypes[i],
                                              onSuccessEdit: () {
                                                getAllItemTypes();
                                              },
                                              onSuccessDelete: () async {
                                                var result =
                                                    await Navigator.pushNamed(
                                                        context,
                                                        ConfirmationModal
                                                            .routeName,
                                                        arguments:
                                                            "Do you want to delete this client");
                                                if (result == true) {
                                                  deleteItemType(itemTypes[i]);
                                                }
                                              },
                                            ),
                                          );
                                        })
                                    : const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: CustomNotFound(
                                                message: "client"),
                                          ),
                                        ],
                                      ))
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}
