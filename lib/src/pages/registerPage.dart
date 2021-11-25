import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_freak/src/authentication/Auth.dart';
import 'package:ecommerce_freak/src/components/background.dart';
import 'package:ecommerce_freak/src/pages/loginPage.dart';
import 'package:ecommerce_freak/src/widgets/kText.dart';

class RegisterPage extends StatelessWidget {
  final _ = Get.put(AuthenticateC(), permanent: true);

  //
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      text: 'REGISTER',
                      fontSize: 36,
                      color: Color(0XFF2661FA),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter name';
                      }
                      return '';
                    },
                    onChanged: _.regName,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  SizedBox(height: 15),

                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Mobile Number';
                      }
                      return '';
                    },
                    onChanged: _.regMobileNumber,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                    ),
                  ),
                  SizedBox(height: 15),

                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return '';
                    },
                    onChanged: _.regEmail,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 15),

                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return '';
                    },
                    onChanged: _.regPassword,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(height: 10),
                  // Container(
                  //   alignment: Alignment.centerRight,
                  //   child: KText(
                  //     text: 'Forget your password?',
                  //     color: Color(0XFF2661FA),
                  //   ),
                  // ),
                  SizedBox(height: 50),
                  Container(
                    alignment: Alignment.centerRight,
                    // margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        _.userRegister(context);
                        // }
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
                          text: 'SIGN UP',
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
                        text: '''Already have account''',
                      ),
                      TextButton(
                        onPressed: () => Get.to(LoginPage()),
                        child: KText(
                          text: 'Sign in',
                          color: Color(0XFF2661FA),
                          fontWeight: FontWeight.bold,
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
