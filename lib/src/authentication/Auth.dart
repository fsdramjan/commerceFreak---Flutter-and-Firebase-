import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_freak/src/pages/bottomBarHome.dart';
import 'package:ecommerce_freak/src/pages/loginPage.dart';
import 'package:ecommerce_freak/src/widgets/kText.dart';

class AuthenticateC extends GetxController {
  final loginEmail = RxString('');
  final loginPassword = RxString('');

  //
  final regName = RxString('');
  final regMobileNumber = RxString('');
  final regEmail = RxString('');
  final regPassword = RxString('');

  //

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  //

  userLogin(BuildContext context) async {
    try {
      final userLogin = await _auth.signInWithEmailAndPassword(
        email: loginEmail.value,
        password: loginPassword.value,
      );
      if (userLogin.user != null) {
        print(userLogin.additionalUserInfo);
        Get.offAll(BottomBarHome());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please fill up form correctly'),
          ),
        );
      }
    } catch (e) {
      print(e);
      final snackbar = SnackBar(
        backgroundColor: Colors.red,
        content: KText(
          text: e.toString(),
          color: Colors.white,
          maxLines: 5,
        ),
      );
      return ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  userRegister(BuildContext context) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: regEmail.value,
        password: regPassword.value,
      );
      print('click');

      if (user.additionalUserInfo!.profile != null) {
        success(user.user!.uid);
      }
    } catch (e) {
      print(e);
      final snackbar = SnackBar(
        backgroundColor: Colors.red,
        content: KText(
          text: e.toString(),
          color: Colors.white,
          maxLines: 5,
        ),
      );
      return ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  signOut() async {
    _auth.signOut();
    print('Logout Success');
    await Get.offAll(LoginPage());
  }

  success(String uid) {
    _firestore.collection('users').doc(uid).set({
      'name': regName.value,
      'mobileNumber': regMobileNumber.value,
      'email': regEmail.value,
      'password': regPassword.value,
      'uid': uid,
      'profileImage': null,
      'coverImage': null,
      'bio': null,
      'nickName': null,
    });
    Get.offAll(BottomBarHome());
  }
}
