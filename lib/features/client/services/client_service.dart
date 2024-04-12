import 'package:facturo/models/client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ClientService {
  final clients = Hive.box("clients");

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
      clients.keys.map((key) {
        var client = clients.get(key) as Client;
        client.id = key;
        clientList.add(client);
      }).toList();
    } catch (e) {
      // showSnackBar(context, e.toString());
      // showSnackBar(context, "Please Check your internet connection");
    }
    return clientList;
  }

  void deleteClient({
    required BuildContext context,
    required Client client,
    required VoidCallback onSuccess,
    required VoidCallback onFailed,
  }) async {
    try {
      clients.delete(client.id);

      onSuccess();
    } catch (e) {
      // showSnackBar(context, e.toString());
      // showSnackBar(context, "Please Check your internet connection");
    }
  }
}
