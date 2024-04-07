

import 'package:facturo/features/client/screens/add_client_screen.dart';
import 'package:facturo/features/client/screens/client_screen.dart';
import 'package:facturo/features/inventory/screens/inventory_screen.dart';
import 'package:facturo/features/invoice/screens/add_invoice_screen.dart';
import 'package:facturo/features/invoice/screens/invoice_screen.dart';
import 'package:facturo/features/setting/screens/setting_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case InvoiceScreen.routeName:
      return PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const InvoiceScreen(),
        );
      });

      case AddInvoiceScreen.routeName:
      return PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const AddInvoiceScreen(),
        );
      });
    
    case ClientScreen.routeName:
      return PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const ClientScreen(),
        );
      });

    case AddClientScreen.routeName:
      return PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const AddClientScreen(),
        );
      });

    case InventoryScreen.routeName:
      return PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const InventoryScreen(),
        );
      });

    case SettingScreen.routeName:
      return PageRouteBuilder(pageBuilder: (_, animation, __) {
        return FadeTransition(
          opacity: animation,
          child: const SettingScreen(),
        );
      });
    
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("404"),
                ),
              ));
  }
}
