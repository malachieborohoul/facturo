import 'package:facturo/models/client.dart';
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

      print(client);
    } catch (e) {
      // showSnackBar(context, e.toString());
      // showSnackBar(context, "Please Check your internet connection");
    }
  }
}
