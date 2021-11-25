import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ecommerce_freak/src/helpers/all_Icons.dart';
import 'package:ecommerce_freak/src/configs/appColors.dart';
import 'package:ecommerce_freak/src/widgets/kText.dart';

Widget backButton() {
  return IconButton(
    onPressed: () => Get.back(),
    icon: SvgPicture.asset(
      backSvg,
      height: 25,
      color: black54,
    ),
  );
}

Widget centerText(String title) {
  return KText(
    text: title,
    fontSize: 20,
    color: black87,
    fontFamily: medium,
  );
}

Widget shoppingBagTopBar() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: Container(
      width: 35,
      decoration: BoxDecoration(
          color: pinkAncent.withOpacity(.50),
          borderRadius: BorderRadius.circular(5)),
      child: Icon(
        Icons.shopping_bag_outlined,
        color: black87,
      ),
    ),
  );
}

Widget moreOptionTopBar() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: Icon(
      Icons.more_vert,
      color: black54,
    ),
  );
}
