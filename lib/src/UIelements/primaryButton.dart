import 'package:ecommerce_freak/src/configs/appColors.dart';
import 'package:ecommerce_freak/src/widgets/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget primaryButton( void Function()? onTap,String title) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 45,
      width: Get.width,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: KText(
            text: title,
            color: white,
            fontSize: 14,
            fontFamily: medium,
          ),
        ),
      ),
    ),
  );
}
