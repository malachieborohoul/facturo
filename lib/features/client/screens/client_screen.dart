import 'package:facturo/common/widgets/dashboard_menu.dart';
import 'package:facturo/constants/color.dart';

import 'package:flutter/material.dart';

class ClientScreen extends StatefulWidget {
  static const routeName = '/clients';
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          const Expanded(
              flex: 2,
              child: DashboardMenu(
                codeScreen: 2,
              )),
          Expanded(
              flex: 5,
              child: Container(
                color: background,
                child: const Center(
                  child: Text("Clients"),
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                color: background,
              )),
        ],
      )),
    );
  }
}
