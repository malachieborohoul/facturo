import 'package:facturo/common/widgets/confirmation_modal.dart';
import 'package:facturo/common/widgets/error_field_modal.dart';
import 'package:facturo/common/widgets/success_field_modal.dart';
import 'package:facturo/features/client/screens/add_client_screen.dart';
import 'package:facturo/features/client/screens/edit_client_screen.dart';
import 'package:facturo/features/client/screens/select_client_screen.dart';
import 'package:facturo/features/client/screens/client_screen.dart';
import 'package:facturo/features/inventory/screens/add_item_screen.dart';
import 'package:facturo/features/inventory/screens/add_item_type_screen.dart';
import 'package:facturo/features/inventory/screens/edit_item_type_screen.dart';
import 'package:facturo/features/inventory/screens/inventory_screen.dart';
import 'package:facturo/features/inventory/screens/select_item_screen.dart';
import 'package:facturo/features/inventory/screens/select_item_type_screen.dart';
import 'package:facturo/features/invoice/screens/add_invoice_screen.dart';
import 'package:facturo/features/invoice/screens/invoice_screen.dart';
import 'package:facturo/features/setting/screens/setting_screen.dart';
import 'package:facturo/models/client.dart';
import 'package:facturo/models/item_type.dart';
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

    case SelectClientScreen.routeName:
      return PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, animation, __) {
            return FadeTransition(
              opacity: animation,
              child: const SelectClientScreen(),
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

    case AddItemScreen.routeName:
      return PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, animation, __) {
            return FadeTransition(
              opacity: animation,
              child: const AddItemScreen(),
            );
          });

    case SelectItemScreen.routeName:
      return PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, animation, __) {
            return FadeTransition(
              opacity: animation,
              child: const SelectItemScreen(),
            );
          });

    case AddItemTypeScreen.routeName:
      return PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, animation, __) {
            return FadeTransition(
              opacity: animation,
              child: const AddItemTypeScreen(),
            );
          });

    case SelectItemTypeScreen.routeName:
      return PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, animation, __) {
            return FadeTransition(
              opacity: animation,
              child: const SelectItemTypeScreen(),
            );
          });

    case ErrorFieldModal.routeName:
      var message = routeSettings.arguments as String;
      return PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, animation, __) {
            return FadeTransition(
              opacity: animation,
              child:  ErrorFieldModal(message: message,),
            );
          });

     case SuccessFieldModal.routeName:
      var message = routeSettings.arguments as String;
      return PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, animation, __) {
            return FadeTransition(
              opacity: animation,
              child:  SuccessFieldModal(message: message,),
            );
          });

    case EditClientScreen.routeName:
      var client = routeSettings.arguments as Client;
      return PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, animation, __) {
            return FadeTransition(
              opacity: animation,
              child:  EditClientScreen(client: client,),
            );
          });

      case EditItemTypeScreen.routeName:
      var itemType = routeSettings.arguments as ItemType;
      return PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, animation, __) {
            return FadeTransition(
              opacity: animation,
              child:  EditItemTypeScreen(itemType: itemType,),
            );
          });
    case ConfirmationModal.routeName:
      var message = routeSettings.arguments as String;
      return PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, animation, __) {
            return FadeTransition(
              opacity: animation,
              child:  ConfirmationModal(message: message,),
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
