import 'package:facturo/common/widgets/dashboard_menu.dart';
import 'package:facturo/constants/color.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
   static const routeName = '/setting';
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          const Expanded(
              flex: 2,
              child:  DashboardMenu(codeScreen: 4,)),
          Expanded(
              flex: 5,
              child: Container(
                color: background,
                child: const Center(child: Text("Setting"),),
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
