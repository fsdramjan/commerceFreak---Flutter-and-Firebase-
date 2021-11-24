import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_upload_firebase/src/configs/appTheme.dart';
import 'package:image_upload_firebase/src/pages/splashPage.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      smartManagement: SmartManagement.onlyBuilder,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: SplashPage(),
    );
  }
}
