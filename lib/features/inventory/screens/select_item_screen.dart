import 'package:facturo/common/widgets/confirmation_modal.dart';
import 'package:facturo/common/widgets/custom_header.dart';
import 'package:facturo/common/widgets/custom_not_found.dart';
import 'package:facturo/common/widgets/custom_searchbar.dart';
import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/global.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:facturo/features/inventory/screens/add_item_screen.dart';
import 'package:facturo/features/inventory/widgets/item_card.dart';
import 'package:facturo/models/item.dart';
import 'package:facturo/models/item_invoice.dart';
import 'package:facturo/models/item_type.dart';
import 'package:facturo/providers/item_invoice_provider.dart';
import 'package:facturo/providers/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectItemScreen extends StatefulWidget {
  static const routeName = '/select-item';

  const SelectItemScreen({super.key, required this.itemType});

  final ItemType itemType;

  @override
  State<SelectItemScreen> createState() => _SelectItemScreenState();
}

class _SelectItemScreenState extends State<SelectItemScreen> {
  TextEditingController searchController = TextEditingController();
  late List<Item> items;
  List<Item> searchResults = [];
  bool isSeaching = false;
  @override
  void initState() {
    super.initState();

    getAllItems();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void getAllItems() {
    items = inventoryService.getAllItems(context, widget.itemType);
    setState(() {});
  }

  void deleteItem(Item item) {
    inventoryService.deleteItem(
        context: context,
        item: item,
        onSuccess: () {
          searchController.text = "";
          isSeaching = false;
          getAllItems();
        },
        onFailed: () {});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    void searchItemTypes(String searchTerm) {
      searchResults.clear();

      for (var item in items) {
        if (item.name.toLowerCase().contains(searchTerm.toLowerCase().trim())) {
          searchResults.add(item);
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
                                  "Retour",
                                  style: TextStyle(color: primary),
                                )),
                            IconButton(
                                onPressed: () async {
                                  final result = await Navigator.pushNamed(
                                      context, AddItemScreen.routeName,
                                      arguments: widget.itemType);
                                  if (result == true) {
                                    getAllItems();
                                  }
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: primary,
                                ))
                          ],
                        ),
                        const CustomHeader(title: "Articles"),
                        const SizedBox(
                          height: smallFontSize,
                        ),
                        CustomSearchbar(
                            controller: searchController,
                            hintText: "Rechercher",
                            width: double.infinity,
                            height: 40,
                            onChange: (value) {
                              if (value.isEmpty) {
                                getAllItems();
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
                                              Provider.of<ItemProvider>(context,
                                                      listen: false)
                                                  .addItem(searchResults[i]);
                                              Navigator.of(context).pop();
                                              Navigator.of(context).pop();
                                            },
                                            child: ItemCard(
                                              itemType: widget.itemType,
                                              item: searchResults[i],
                                              onSuccessEdit: () {
                                                getAllItems();
                                              },
                                              onSuccessDelete: () async {
                                                var result =
                                                    await Navigator.pushNamed(
                                                        context,
                                                        ConfirmationModal
                                                            .routeName,
                                                        arguments:
                                                            "Voulez-vous supprimer cet article ?");
                                                if (result == true) {
                                                  deleteItem(searchResults[i]);
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
                                            child:
                                                CustomNotFound(message: "article"),
                                          ),
                                        ],
                                      )
                                : items.isNotEmpty
                                    ? ListView.builder(
                                        itemCount: items.length,
                                        itemBuilder: (context, i) {
                                          return InkWell(
                                            onTap: () {
                                              //  Provider.of<ItemProvider>(context,
                                              //         listen: false)
                                              //     .addItem(items[i]);
                                              final itemInvoice = ItemInvoice(
                                                  id: items[i].id,
                                                  name: items[i].name,
                                                  quantity: 0,
                                                  price: items[i].price,
                                                  itemType: items[i].itemType);
                                              Provider.of<ItemInvoiceProvider>(
                                                      context,
                                                      listen: false)
                                                  .addItem(itemInvoice);
                                              Navigator.of(context).pop();
                                              Navigator.of(context).pop();
                                            },
                                            child: ItemCard(
                                              itemType: widget.itemType,
                                              item: items[i],
                                              onSuccessEdit: () {
                                                getAllItems();
                                              },
                                              onSuccessDelete: () async {
                                                var result =
                                                    await Navigator.pushNamed(
                                                        context,
                                                        ConfirmationModal
                                                            .routeName,
                                                        arguments:
                                                            "Voulez vous supprimer ce type d'article");
                                                if (result == true) {
                                                  deleteItem(items[i]);
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
                                            child:
                                                CustomNotFound(message: "article"),
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
