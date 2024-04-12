import 'package:facturo/common/widgets/custom_button.dart';
import 'package:facturo/constants/color.dart';
import 'package:facturo/constants/padding.dart';
import 'package:facturo/constants/size.dart';
import 'package:flutter/material.dart';

class ConfirmationModal extends StatelessWidget {
  static const routeName = '/confirmation-modal';

  const ConfirmationModal({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned.fill(
                child: Container(
              color: Colors.black26,
            )),
            Positioned(
                top: size.height / 2 - (size.height * 0.4) / 2,
                right: size.width / 2 - (size.width * 0.25) / 2,
                child: Container(
                  height: size.height * 0.4,
                  width: size.width * 0.25,
                  decoration: const BoxDecoration(
                      color: background,
                      borderRadius:
                          BorderRadius.all(Radius.circular(smallFontSize))),
                  child: Padding(
                    padding: const EdgeInsets.all(appPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.info_outline,
                          size: 100,
                          color: primary,
                        ),
                        const SizedBox(
                          height: smallFontSize,
                        ),
                        Text(
                          " $message ",
                          style: const TextStyle(
                              color: textBlack, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: smallFontSize,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const CustomButtom(
                                title: "Cancel",
                                bgColor: neutral,
                                color: textBlack,
                              ),
                            ),
                            const SizedBox(width: smallSpacer,),
                             InkWell(
                              onTap: () {
                                Navigator.pop(context, true);
                              },
                              child: const CustomButtom(
                                title: "Delete",
                                bgColor: neutral,
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}
