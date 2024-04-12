import 'package:facturo/common/widgets/confirmation_modal.dart';
import 'package:facturo/common/widgets/custom_not_found.dart';
import 'package:facturo/constants/global.dart';
import 'package:facturo/features/client/widgets/client_card.dart';
import 'package:facturo/common/widgets/custom_header.dart';
import 'package:facturo/common/widgets/custom_searchbar.dart';
import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:facturo/features/client/screens/add_client_screen.dart';
import 'package:facturo/models/client.dart';
import 'package:flutter/material.dart';

class SelectClientScreen extends StatefulWidget {
  static const routeName = '/select-client';

  const SelectClientScreen({super.key});

  @override
  State<SelectClientScreen> createState() => _SelectClientScreenState();
}

class _SelectClientScreenState extends State<SelectClientScreen> {
  TextEditingController searchController = TextEditingController();
  late Future<List<Client>> clients;

  @override
  void initState() {
    super.initState();
    getAllClients();
  }

  void getAllClients() {
    clients = clientService.getAllClients(context);
    setState(() {});
  }

  void deleteClient(Client client) {
    clientService.deleteClient(
        context: context,
        client: client,
        onSuccess: () {
          getAllClients();
        },
        onFailed: () {});
    setState(() {});
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
                            IconButton(
                                onPressed: () async {
                                  final result = await Navigator.pushNamed(
                                      context, AddClientScreen.routeName);

                                  if (result == true) {
                                    getAllClients();
                                  }
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
                        Expanded(
                            child: FutureBuilder(
                                future: clients,
                                builder: (context,
                                    AsyncSnapshot<List<Client>> snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator(
                                      color: primary,
                                    );
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else if (snapshot.hasData &&
                                        snapshot.data!.isNotEmpty) {
                                      return ListView.builder(
                                          itemCount: snapshot.data!.length,
                                          itemBuilder: (context, i) {
                                            return ClientCard(
                                              client: snapshot.data![i],
                                              onSuccessEdit: () {
                                                getAllClients();
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
                                                  deleteClient(
                                                      snapshot.data![i]);
                                                }
                                              },
                                            );
                                          });
                                    } else {
                                      return const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: CustomNotFound(
                                                message: "client"),
                                          ),
                                        ],
                                      );
                                    }
                                  } else {
                                    return const SizedBox();
                                  }
                                }))
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}
