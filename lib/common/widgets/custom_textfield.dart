

import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      required this.controller,
      this.textInputType = TextInputType.text,
      required this.hintText,
      this.isPassword = false,
      this.readOnly = false,
      this.onTap = false,
      this.width=double.infinity,
    
      required this.onSuccess,  this.height=30});

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
              keyboardType: textInputType,
              inputFormatters: textInputType==TextInputType.number ?  [
                FilteringTextInputFormatter.digitsOnly
              ]:[],
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: smallFontSize * 0.8, color: textBlack),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: appPadding),
                 enabledBorder:  UnderlineInputBorder(borderSide: BorderSide(color:neutralBorder.withOpacity(0.5) )),

                    focusedBorder:  UnderlineInputBorder(borderSide: BorderSide(color:neutralBorder.withOpacity(0.5) )),
                  hintText: hintText,
                  hintStyle: const TextStyle(
                      color: textGrey, fontSize: smallFontSize * 0.8),
                  filled: true,
                  fillColor: Colors.transparent,
                  border: InputBorder.none,
                  ),
            ),
    );
  }
}
