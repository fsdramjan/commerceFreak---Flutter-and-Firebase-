import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_upload_firebase/src/UIelements/topBarElements.dart';
import 'package:image_upload_firebase/src/configs/appColors.dart';
import 'package:image_upload_firebase/src/controllers/productController.dart';
import 'package:image_upload_firebase/src/widgets/kText.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor,
        leading: backButton(),
        title: centerText('CART'),
        actions: [
          moreOptionTopBar(),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                itemCount: listProduct.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = listProduct[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: white,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 10,
                            child: Image.asset(
                              '${item['image']}',
                              width: 90,
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            child: productTitlePrice(item),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productTitlePrice(item) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KText(
          text: '${item['title']}',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              size: 10,
              color: buttonColor,
            ),
            KText(
              text: '(5.0)',
              fontSize: 10,
              color: black54,
              fontFamily: bold,
            )
          ],
        ),
        KText(
          text: '\$${item['price']}',
          fontFamily: bold,
        ),
      ],
    );
  }
}
