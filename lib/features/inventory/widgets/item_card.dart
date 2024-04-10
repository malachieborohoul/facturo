import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

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
              Icon(Icons.inventory_2_outlined, color: textBlack,),
              SizedBox(width: smallFontSize,),
              Text("Battery 201")
            ],),
        
            IconButton(onPressed: (){}, icon: const Icon(Icons.delete_outline_outlined,color: Colors.redAccent,))
          ],
        ),
      ),
    );
  }
}
