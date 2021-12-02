import 'package:ecommerce_freak/src/UIelements/topBarElements.dart';
import 'package:ecommerce_freak/src/configs/appColors.dart';
import 'package:ecommerce_freak/src/controllers/productController.dart';
import 'package:ecommerce_freak/src/pages/paymentsPage.dart';

import 'package:ecommerce_freak/src/widgets/kText.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
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
                                    top: 10,
                                    left: 130,
                                    child: productTitlePrice(item),
                                  ),
                                  Positioned(
                                    right: 10,
                                    bottom: 10,
                                    child: quantityButton(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: white,
                            border: Border.all(
                              color: black54.withOpacity(.10),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Checkbox(
                            fillColor:
                                MaterialStateProperty.all(Colors.transparent),
                            checkColor: buttonColor,
                            value: value,
                            onChanged: (value) {
                              setState(() {
                                this.value = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 120),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 115,
        width: Get.width,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: Offset(0, 16),
              blurRadius: 150,
              spreadRadius: .10,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  KText(
                    text: 'Selected Items (${listProduct.length})',
                    fontFamily: medium,
                    fontSize: 14,
                    color: black87,
                  ),
                  KText(
                    text: 'Total : \$800.00',
                    fontFamily: bold,
                    fontSize: 15,
                    color: black87,
                  ),
                ],
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () => Get.to(PaymentsPage()),
                child: Container(
                  height: 45,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: KText(
                        text: 'Checkout',
                        color: white,
                        fontSize: 14,
                        fontFamily: medium,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productTitlePrice(item) {
    return Container(
      // alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KText(
            text: '${item['title']}',
            fontSize: 14,
            fontFamily: medium,
          ),
          SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                fontFamily: medium,
              )
            ],
          ),
          SizedBox(height: 3),
          KText(
            text: '\$${item['price']}',
            fontFamily: bold,
          ),
        ],
      ),
    );
  }

  Widget quantityButton() {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: 13,
            backgroundColor: backgroundColor,
            child: Icon(
              Icons.remove,
              size: 15,
              color: black,
            ),
          ),
          SizedBox(width: 7),
          KText(
            text: '1',
            fontFamily: medium,
            fontSize: 14,
          ),
          SizedBox(width: 7),
          CircleAvatar(
            radius: 13,
            backgroundColor: pinkAncent.withOpacity(.50),
            child: Icon(
              Icons.add,
              size: 15,
              color: Colors.pinkAccent.withOpacity(.70),
            ),
          ),
        ],
      ),
    );
  }
}
