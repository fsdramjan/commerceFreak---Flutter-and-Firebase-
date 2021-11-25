import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ecommerce_freak/src/pages/bottomBarHome.dart';
import 'package:ecommerce_freak/src/pages/loginPage.dart';

class CheckUserAuth extends GetxController {
  final _auth = FirebaseAuth.instance;
  void checkUserAuth() async {
    try {
      print(_auth.currentUser);
      await Future.delayed(Duration(seconds: 2));

      _auth.currentUser != null
          ? Get.offAll(BottomBarHome())
          : Get.offAll(LoginPage());
    } catch (e) {
      print(e);
    }
  }
}
