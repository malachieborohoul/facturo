

import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/material.dart';

class CustomSearchbar extends StatelessWidget {
  const CustomSearchbar(
      {super.key,
      required this.controller,
      this.textInputType = TextInputType.text,
      required this.hintText,
      this.isPassword = false,
      this.readOnly = false,
      this.onTap = false,
      this.width=200,
    
      required this.onSuccess,  this.height=55});

  final TextEditingController controller;
  final TextInputType textInputType;
  final String hintText;
  final bool isPassword;
  final bool readOnly;
  final bool onTap;
  final double width;
  final double height;

  final VoidCallback onSuccess;

  @override
  Widget build(BuildContext context) {
   

    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration:  const BoxDecoration(
        color:  Colors.transparent,
        // border: Border.all( color: neutral, style: BorderStyle.solid, width: 0.5)
      ),
      child:  TextField(
              readOnly: readOnly ? true : false,
              controller: controller,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                 enabledBorder: const OutlineInputBorder(
                      borderSide:  BorderSide(color: neutralBorder, width: 0.5),
                          
                      borderRadius: BorderRadius.all(Radius.circular(miniSpacer)),
                    ),

                    focusedBorder: const OutlineInputBorder(
                      borderSide:  BorderSide(color: primary, width: 1),
                          
                      borderRadius: BorderRadius.all(Radius.circular(miniSpacer)),
                    ),
                  hintText: hintText,
                  hintStyle: const TextStyle(
                      color: textGrey, fontSize: smallFontSize),
                  filled: true,
                  fillColor: Colors.transparent,
                  border: InputBorder.none,
                  prefixIcon:  const Icon(
                    size: smallFontSize,
                    Icons.search,
                    color: blueLight,
                  )),
            ),
    );
  }
}
