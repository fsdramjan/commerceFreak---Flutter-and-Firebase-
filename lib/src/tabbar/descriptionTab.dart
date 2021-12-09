import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_freak/src/controllers/BaseController.dart';
import 'package:ecommerce_freak/src/widgets/kText.dart';
import 'package:flutter/material.dart';

class DescriptionTab extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: allProductC.getAllProducts(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // final item = snapshot.data;

          return ListView(
            children: [
              SizedBox(height: 10),
              Expanded(
                child: KText(text: 'Testing'),
              ),
            ],
          );
        });
  }
}
