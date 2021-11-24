import 'package:flutter/material.dart';
import 'package:image_upload_firebase/src/controllers/BaseController.dart';
import 'package:image_upload_firebase/src/widgets/kText.dart';

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
