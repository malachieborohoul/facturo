import 'package:facturo/common/widgets/dashboard_menu_item.dart';
import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardMenu extends StatelessWidget {
  const DashboardMenu({super.key, this.codeScreen = 1});
  final int codeScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: neutral,
      child: Padding(
        padding: const EdgeInsets.all(appPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "FACTURO",
              style: TextStyle(
                  color: primary,
                  fontSize: largeFontSize,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: smallSpacer,
            ),
            codeScreen == 1
                ? GestureDetector(
                    onTap: () {
                      print("Invoice");
                    },
                    child: DashboardMenuItem(
                      icon: Icons.file_present_outlined,
                      name: 'Invoices',
                      selected: codeScreen == 1 ? true : false,
                    ))
                : DashboardMenuItem(
                    icon: Icons.file_present_outlined,
                    name: 'Invoices',
                    selected: codeScreen == 1 ? true : false,
                  ),
            codeScreen == 2
                ? GestureDetector(
                   onTap: () {
                      print("Clients");
                    },
                    child: DashboardMenuItem(
                      icon: Icons.people_outline,
                      name: 'Clients',
                      selected: codeScreen == 2 ? true : false,
                    ),
                  )
                : DashboardMenuItem(
                    icon: Icons.people_outline,
                    name: 'Clients',
                    selected: codeScreen == 2 ? true : false,
                  ),
            codeScreen == 3
                ? GestureDetector(
                     onTap: () {
                      print("Invenory");
                    },
                    child: DashboardMenuItem(
                        icon: Icons.inventory_2_outlined,
                        name: 'Inventory',
                        selected: codeScreen == 3 ? true : false))
                : DashboardMenuItem(
                    icon: Icons.inventory_2_outlined,
                    name: 'Inventory',
                    selected: codeScreen == 3 ? true : false),
            codeScreen == 4
                ? GestureDetector(
                     onTap: () {
                      print("Settins");
                    },
                    child: DashboardMenuItem(
                        icon: Icons.settings_outlined,
                        name: 'Settings',
                        selected: codeScreen == 4 ? true : false))
                : DashboardMenuItem(
                    icon: Icons.settings_outlined,
                    name: 'Settings',
                    selected: codeScreen == 4 ? true : false),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
