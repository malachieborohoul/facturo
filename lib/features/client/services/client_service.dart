

import 'package:facturo/models/client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ClientService {
  final clients = Hive.box("clients");

  // RESERVE BOOK
  void addClient({
    required BuildContext context,
    required String businessName,
    required String name,
    required String address,
    required VoidCallback onSuccess,
    required VoidCallback onFailed,
  }) async {
    try {
      var client = await clients.add(Client.fromMap({
        'businessName': businessName,
        'name': name,
        'address': address,
      }));
      onSuccess();

      if (kDebugMode) {
        print(client);
      }
    } catch (e) {
      // showSnackBar(context, e.toString());
      // showSnackBar(context, "Please Check your internet connection");
    }
  }

  Future<List<Client>> getAllClients(BuildContext context) async {
    List<Client> clientList = [];

    try {
      clients.keys.map((key){
        var client = clients.get(key) as Client;
        clientList.add(client);
      }).toList();
      // Map on books and add in Hive

      // for (int i = 0; i < jsonDecode(res.body)["books"].length; i++) {
      //   // Add in clientList
      //   clientList.add(
      //     Book.fromMap(
      //       jsonDecode(res.body)["books"][i],
      //     ),
      //   );

      //   // Add in Hive DB
      //   booksBox.add(Book.fromMap(jsonDecode(res.body)["books"][i]));
      // }
    } catch (e) {
      // showSnackBar(context, e.toString());
      // showSnackBar(context, "Please Check your internet connection");
    }
    return clientList;
  }
}
