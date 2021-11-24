import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_upload_firebase/src/UIelements/topBarElements.dart';
import 'package:image_upload_firebase/src/helpers/all_Icons.dart';
import 'package:image_upload_firebase/src/configs/appColors.dart';
import 'package:image_upload_firebase/src/pages/productDetailsPage.dart';
import 'package:image_upload_firebase/src/widgets/kText.dart';

class FavoriteProductsPage extends StatelessWidget {
  final listProduct = [
    {
      'id': '1',
      'title': 'Nike Air Max',
      'price': '150.00',
      'discount': '30%',
      'discountPrice': '300.00',
      'image': 'assets/img/shoes1.png',
    },
    {
      'id': '2',
      'title': 'Cannon 600d',
      'price': '250.00',
      'discount': '50%',
      'discountPrice': '600.00',
      'image': 'assets/img/shoes2.png',
    },
    {
      'id': '3',
      'title': 'Cannon 600d',
      'price': '250.00',
      'discount': '50%',
      'discountPrice': '600.00',
      'image': 'assets/img/shoes2.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor,
        // leading: backButton(),
        title: centerText('FAVOURITE'),
        actions: [
          shoppingBagTopBar(),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: padding20,
          child: Column(
            children: [
              SizedBox(height: 10),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 16,
                  childAspectRatio: .68,
                ),
                shrinkWrap: true,
                itemCount: listProduct.length,
                primary: false,
                itemBuilder: (BuildContext context, int index) {
                  final item = listProduct[index];
                  return GestureDetector(
                    onTap: () => Get.to(
                        ProductDetailsPage(item: item, id: '${item['id']}')),
                    child: Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: KText(
                                  text: '${item['discount']} Off',
                                  fontSize: 12,
                                  fontFamily: medium,
                                  color: Colors.lightBlue,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: backgroundColor,
                                  child: SvgPicture.asset(
                                    wishlistSvg,
                                    height: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Image.asset(
                                    '${item['image']}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 20),
                                KText(
                                  text: '${item['title']}',
                                  fontFamily: medium,
                                  fontSize: 14,
                                ),
                                // SizedBox(height: 0),
                                Row(
                                  children: [
                                    KText(
                                      text: '\$${item['price']}',
                                      fontFamily: bold,
                                      fontSize: 14,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
