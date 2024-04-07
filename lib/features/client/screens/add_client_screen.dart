import 'package:flutter/material.dart';

class AddClientScreen extends StatefulWidget {
  static const routeName = '/add-client';

  const AddClientScreen({super.key});

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned.fill(
                child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.black26,
              ),
            )),


            Container()
          ],
        ));
  }
}
