import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_upload_firebase/src/authentication/checkUserAuth.dart';
import 'package:image_upload_firebase/src/controllers/BaseController.dart';
import 'package:image_upload_firebase/src/widgets/kText.dart';

class SplashPage extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
  
    Get.put(CheckUserAuth()).checkUserAuth();

    return Scaffold(
      body: Center(
        child: KText(text: 'Splash Screen'),
      ),
    );
  }
}
