import 'package:facturo/core/constants/color.dart';
import 'package:facturo/core/constants/padding.dart';
import 'package:facturo/core/constants/size.dart';
import 'package:flutter/material.dart';

class ClientCard extends StatelessWidget {
  const ClientCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(smallFontSize))


      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:  appPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(children: [
              Icon(Icons.person, color: textBlack,),
              SizedBox(width: smallFontSize,),
              Text("ALC")
            ],),
        
            IconButton(onPressed: (){}, icon: const Icon(Icons.delete_outline_outlined,color: Colors.redAccent,))
          ],
        ),
      ),
    );
  }
}