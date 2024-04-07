import 'package:facturo/common/widgets/dashboard_menu.dart';
import 'package:facturo/constants/color.dart';
import 'package:flutter/material.dart';

class InventoryScreen extends StatefulWidget {
   static const routeName = '/inventory';
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          const Expanded(
              flex: 2,
              child:  DashboardMenu(codeScreen: 3,)),
          Expanded(
              flex: 5,
              child: Container(
                color: background,
                child: const Center(child: Text("Inventory"),),
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
