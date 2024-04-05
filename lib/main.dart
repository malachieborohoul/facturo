import 'package:facturo/constants/color.dart';
import 'package:facturo/features/invoice/screens/invoice_screen.dart';
import 'package:facturo/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      
       
        primaryColor: primary,
        useMaterial3: true,
      ),
      home: const InvoiceScreen(),
    );
  }
}

