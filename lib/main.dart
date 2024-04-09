import 'package:facturo/core/constants/color.dart';
import 'package:facturo/core/theme/theme.dart';
import 'package:facturo/features/invoice/presentation/screens/invoice_screen.dart';
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
      theme: AppTheme.themeMode,
      home: const InvoiceScreen(),
    );
  }
}

