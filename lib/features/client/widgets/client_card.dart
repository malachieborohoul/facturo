import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:facturo/models/client.dart';
import 'package:flutter/material.dart';

class ClientCard extends StatelessWidget {
  const ClientCard({super.key, required this.client});
  final Client client;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: miniSpacer),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(smallFontSize))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: appPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Row(
                children: [
                  const Icon(
                    Icons.person,
                    color: textBlack,
                  ),
                  const SizedBox(
                    width: smallFontSize,
                  ),
                  Text(client.businessName)
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_outline_outlined,
                    color: Colors.redAccent,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
