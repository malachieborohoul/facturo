import 'package:facturo/features/client/widgets/client_card.dart';
import 'package:facturo/common/widgets/custom_header.dart';
import 'package:facturo/common/widgets/custom_searchbar.dart';
import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:facturo/features/client/screens/add_client_screen.dart';
import 'package:flutter/material.dart';

class SelectClientScreen extends StatefulWidget {
  static const routeName = '/select-client';

  const SelectClientScreen({super.key});

  @override
  State<SelectClientScreen> createState() => _SelectClientScreenState();
}

class _SelectClientScreenState extends State<SelectClientScreen> {
  TextEditingController searchController = TextEditingController();

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
                            IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AddClientScreen.routeName);
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: primary,
                                ))
                          ],
                        ),
                        const CustomHeader(title: "Clients"),
                        const SizedBox(
                          height: smallFontSize,
                        ),
                        CustomSearchbar(
                            controller: searchController,
                            hintText: "Search",
                            width: double.infinity,
                            height: 40,
                            onSuccess: () {}),
                        const SizedBox(
                          height: smallFontSize,
                        ),
                        const ClientCard(),
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}
