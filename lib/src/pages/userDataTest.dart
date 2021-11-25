import 'package:flutter/material.dart';
import 'package:ecommerce_freak/src/controllers/BaseController.dart';
import 'package:ecommerce_freak/src/widgets/kText.dart';

class ChatPage extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          InkWell(
              onTap: () {
                authC.signOut();
              },
              child: KText(text: 'SignOut')),
        ],
      ),
    );
  }
}
