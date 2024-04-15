import 'package:facturo/constants/color.dart';
import 'package:facturo/features/invoice/screens/invoice_screen.dart';
import 'package:facturo/models/client.dart';
import 'package:facturo/models/invoice.dart';
import 'package:facturo/models/invoice_item.dart';
import 'package:facturo/models/item.dart';
import 'package:facturo/models/item_type.dart';
import 'package:facturo/providers/client_provider.dart';
import 'package:facturo/providers/item_provider.dart';
import 'package:facturo/router.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  // Initialize hive before MyApp runs
  WidgetsFlutterBinding.ensureInitialized();
  // Provide path
  await Hive.initFlutter();

  Hive.registerAdapter(ClientAdapter());
  Hive.registerAdapter(InvoiceAdapter());
  Hive.registerAdapter(ItemAdapter());
  Hive.registerAdapter(ItemTypeAdapter());
  Hive.registerAdapter(InvoiceItemAdapter());
  // Open boxes
  await Hive.openBox("invoices");
  await Hive.openBox("clients");
  await Hive.openBox("items");
  await Hive.openBox("item_types");
  await Hive.openBox("invoice_items");

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ClientProvider(),
    ),
     ChangeNotifierProvider(
      create: (context) => ItemProvider(),
    ),
  ],
  child:  const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => generateRoute(settings),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primary,
      ),
      home: const InvoiceScreen(),
    );
  }
}
