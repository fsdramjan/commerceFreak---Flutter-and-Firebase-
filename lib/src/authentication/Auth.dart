import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:ecommerce_freak/src/pages/bottomBarHome.dart';
import 'package:ecommerce_freak/src/pages/loginPage.dart';
import 'package:ecommerce_freak/src/widgets/kText.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  final _googleSignIn = GoogleSignIn();
  final _facebookSignIn = FacebookAuth.instance;

//

  signInWithGoogle(BuildContext context) async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final user = (await _auth.signInWithCredential(credential)).user;
      if (user != null) {
        success(user.uid, user, false);
        print(user.displayName);
        print('--------------');
        print('Google Sign in Success');
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
  //
  signInWithFacebook(BuildContext context) async {
    try {
      final facebookUser = await _facebookSignIn.login();
      final credential = FacebookAuthProvider.credential(
         facebookUser.accessToken!.token,
      );
      final user = (await _auth.signInWithCredential(credential)).user;
      if (user != null) {
        success(user.uid, user, false);
        print(user.displayName);
        print('--------------');
        print('Facebook Sign in Success');
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
        success(user.user!.uid, user.user, true);
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

  success(String uid, User? user, bool isGoogleRegistration) async {
    final isOldUser = await isUserExists(uid);
    if (!isOldUser) {
      await _firestore.collection('users').doc(uid).set({
        'name': isGoogleRegistration ? regName.value : user!.displayName,
        'mobileNumber': isGoogleRegistration ? regMobileNumber.value : null,
        'email': isGoogleRegistration ? regEmail.value : user!.email,
        'password': isGoogleRegistration ? regPassword.value : null,
        'uid': uid,
        'profileImage': isGoogleRegistration ? null : user!.photoURL,
        'coverImage': null,
        'bio': null,
        'nickName': null,
      });
      Get.offAll(BottomBarHome());
    }
    Get.offAll(BottomBarHome());
  }

  Future<bool> isUserExists(String uid) async {
    final user = await _firestore.collection('users').doc(uid).get();
    return user.exists;
  }
}
