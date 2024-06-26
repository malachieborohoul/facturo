import 'package:facturo/common/widgets/dashboard_menu_item.dart';
import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:facturo/features/client/screens/client_screen.dart';
import 'package:facturo/features/client/screens/select_client_screen.dart';
import 'package:facturo/features/inventory/screens/inventory_screen.dart';

import 'package:facturo/features/invoice/screens/invoice_screen.dart';
import 'package:facturo/features/setting/screens/setting_screen.dart';
import 'package:flutter/material.dart';

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
                       Navigator.pushReplacementNamed(
                              context, InvoiceScreen.routeName);
                    },
                    child: DashboardMenuItem(
                      icon: Icons.file_present_outlined,
                      name: 'Factures',
                      selected: codeScreen == 1 ? true : false,
                    )):
                     GestureDetector(
                    onTap: () {
                       Navigator.pushReplacementNamed(
                              context, InvoiceScreen.routeName);
                    },
                    child: DashboardMenuItem(
                      icon: Icons.file_present_outlined,
                      name: 'Factures',
                      selected: codeScreen == 1 ? true : false,
                    )),
              
           
     
            codeScreen == 2
                ? GestureDetector(
                     onTap: () {
                          Navigator.pushReplacementNamed(
                              context, SettingScreen.routeName);
                    },
                    child: DashboardMenuItem(
                        icon: Icons.settings_outlined,
                        name: 'Paramètres',
                        selected: codeScreen == 4 ? true : false))
                : 
                GestureDetector(
                     onTap: () {
                          Navigator.pushReplacementNamed(
                              context, SettingScreen.routeName);
                    },
                    child: DashboardMenuItem(
                        icon: Icons.settings_outlined,
                        name: 'Paramètres',
                        selected: codeScreen == 4 ? true : false)),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
