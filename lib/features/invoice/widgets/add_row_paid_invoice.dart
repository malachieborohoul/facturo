import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/material.dart';

class AddRowPaidInvoice extends StatefulWidget {
  const AddRowPaidInvoice({super.key, });

  @override
  State<AddRowPaidInvoice> createState() => _AddRowPaidInvoiceState();
}

class _AddRowPaidInvoiceState extends State<AddRowPaidInvoice> {
  bool isPaid = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Container(
      width: size.width * 0.7,
      decoration: const BoxDecoration(
          color: textWhite,
          borderRadius: BorderRadius.all(Radius.circular(smallFontSize))),
      child: Padding(
        padding: const EdgeInsets.all(appPadding),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                    child: Text(
                  "Paid",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        
                      isPaid = !isPaid;
                      });
                    },
                    child: Icon(isPaid == true
                        ? Icons.toggle_on_outlined
                        : Icons.toggle_off_outlined, size: smallFontSize*3, color: isPaid==true? primary: textBlack,),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
