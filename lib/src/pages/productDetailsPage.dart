import 'package:ecommerce_freak/src/pages/cartPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ecommerce_freak/src/UIelements/topBarElements.dart';
import 'package:ecommerce_freak/src/helpers/all_Icons.dart';
import 'package:ecommerce_freak/src/configs/appColors.dart';
import 'package:ecommerce_freak/src/widgets/kText.dart';
import 'package:ecommerce_freak/src/widgets/tabBar.dart';

class ProductDetailsPage extends StatelessWidget {
  final String id;
  final Map<String, dynamic> item;
  ProductDetailsPage({
    Key? key,
    required this.item,
    required this.id,
  }) : super(key: key);

  final List<String> itemSize = [
    'S',
    'M',
    'L',
    'XL',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor,
        leading: backButton(),
        title: centerText('Product'),
        actions: [
          shoppingBagTopBar(),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          child: Image.asset(
                            '${item['image']}',
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KText(
                            text: 'FASHION',
                            fontFamily: medium,
                            color: Colors.lightBlue,
                            fontSize: 11,
                          ),
                          SizedBox(width: 5),
                          KText(
                            text: '\$${item['discountPrice']}',
                            fontFamily: regular,
                            decoration: TextDecoration.lineThrough,
                            color: black54,
                            fontSize: 12,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          KText(
                            text: '${item['title']}',
                            fontFamily: bold,
                            fontSize: 16,
                          ),
                          SizedBox(width: 5),
                          KText(
                            text: '\$${item['price']}',
                            fontFamily: bold,
                            color: buttonColor,
                            fontSize: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              KText(
                text: 'Item Size',
                fontFamily: medium,
                color: black,
                fontSize: 14,
              ),
              SizedBox(height: 5),
              Container(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: itemSize.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = itemSize[index];

                    return Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: white,
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: 40,
                        child: Center(
                          child: KText(
                            text: item,
                            fontSize: 16,
                            fontFamily: medium,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              TabbarCustom(),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 120,
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
                  quantityButton(),
                  KText(
                    text: 'Total : ${item['price']}',
                    fontFamily: bold,
                    fontSize: 15,
                    color: black87,
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        wishlistSvg,
                        height: 20,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.to(CartPage()),
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
                              text: 'Add to Cart',
                              color: white,
                              fontSize: 14,
                              fontFamily: medium,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget quantityButton() {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: backgroundColor,
            child: Icon(
              Icons.remove,
              size: 20,
              color: black,
            ),
          ),
          SizedBox(width: 7),
          KText(
            text: '01',
            fontFamily: medium,
            fontSize: 14,
          ),
          SizedBox(width: 7),
          CircleAvatar(
            radius: 15,
            backgroundColor: buttonColor,
            child: Icon(
              Icons.add,
              size: 20,
              color: white,
            ),
          ),
        ],
      ),
    );
  }
}
