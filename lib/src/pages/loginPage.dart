import 'dart:ui';

import 'package:ecommerce_freak/src/configs/appColors.dart';
import 'package:ecommerce_freak/src/controllers/BaseController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_freak/src/authentication/Auth.dart';
import 'package:ecommerce_freak/src/components/background.dart';
import 'package:ecommerce_freak/src/pages/registerPage.dart';
import 'package:ecommerce_freak/src/widgets/kText.dart';

class LoginPage extends StatelessWidget with BaseController {
  final _ = Get.put(AuthenticateC(), permanent: true);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BackGround(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: KText(
                      text: 'LOGIN',
                      fontSize: 36,
                      color: Color(0XFF2661FA),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return '';
                    },
                    onChanged: _.loginEmail,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return '';
                    },
                    onChanged: _.loginPassword,
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: KText(
                        text: 'Forget your password?',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFF2661FA),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    alignment: Alignment.centerRight,
                    // margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() ||
                            _.loginEmail.value.isNotEmpty) {
                          _.userLogin(context);
                        }
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      textColor: Colors.white,
                      padding: EdgeInsets.all(0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 255, 136, 34),
                              Color.fromARGB(255, 255, 177, 41)
                            ],
                          ),
                        ),
                        child: KText(
                          text: 'LOGIN',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      KText(
                        text: '''Don't have account?''',
                      ),
                      TextButton(
                        onPressed: () => Get.to(RegisterPage()),
                        child: KText(
                          text: 'Sign up',
                          color: Color(0XFF2661FA),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => authC.signInWithFacebook(context),

                        child: CircleAvatar(
                          radius: 15,
                          child: KText(
                            text: 'f',
                            color: white,
                            fontSize: 20,
                            fontFamily: medium,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () => authC.signInWithGoogle(context),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: red,
                          child: Center(
                            child: KText(
                              text: 'G',
                              color: white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
