import 'package:flutter/material.dart';

const String assetImg = 'assets/images/';


void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    content: Text(text)));
}