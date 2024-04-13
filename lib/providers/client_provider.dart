import 'package:facturo/models/client.dart';
import 'package:flutter/material.dart';

class ClientProvider extends ChangeNotifier {
  Client _client = Client(id: 0, businessName: "", name: "", address: "");
  Client get client => _client;

  void setClient(Map<String, dynamic> client) {
    _client = Client.fromMap(client);
    notifyListeners();
  }
}
