import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_freak/src/authentication/checkUserAuth.dart';
import 'package:ecommerce_freak/src/controllers/BaseController.dart';
import 'package:ecommerce_freak/src/widgets/kText.dart';

class SplashPage extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    Get.put(CheckUserAuth()).checkUserAuth();

    return Scaffold(
      body: Center(
        child: RichText(text: TextSpan(children: [])),
      ),
    );
  }
}
