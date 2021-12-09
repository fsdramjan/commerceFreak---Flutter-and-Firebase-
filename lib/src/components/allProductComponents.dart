import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_freak/src/controllers/BaseController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ecommerce_freak/src/controllers/productController.dart';
import 'package:ecommerce_freak/src/helpers/all_Icons.dart';
import 'package:ecommerce_freak/src/configs/appColors.dart';
import 'package:ecommerce_freak/src/pages/productDetailsPage.dart';
import 'package:ecommerce_freak/src/widgets/kText.dart';

class AllProductComponent extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding20,
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KText(
                  text: 'Products',
                  fontSize: 16,
                  color: black,
                  fontFamily: medium,
                ),
                KText(
                  text: 'See all',
                  fontSize: 12,
                  fontFamily: medium,
                  color: black54,
                ),
              ],
            ),
            SizedBox(height: 20),
            StreamBuilder(
                stream: allProductC.getAllProducts(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 16,
                      childAspectRatio: .68,
                    ),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.size,
                    primary: false,
                    itemBuilder: (BuildContext context, int index) {
                      final item = listProduct[index];
                      final items = snapshot.data!.docs[index].data();
                      final id = snapshot.data!.docs[index].id;

                      return GestureDetector(
                        onTap: () => Get.to(ProductDetailsPage(
                            item: items, id: id)),
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: KText(
                                      text: '${items['productDiscount']}% Off',
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              '${items['productImageUrl']}',
                                          fit: BoxFit.cover,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              Center(
                                            child: CircularProgressIndicator(
                                                backgroundColor: Colors.brown,
                                                value:
                                                    downloadProgress.progress),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        )),
                                    SizedBox(height: 20),
                                    KText(
                                      text: '${items['productTitle']}',
                                      fontFamily: medium,
                                      fontSize: 14,
                                    ),
                                    // SizedBox(height: 0),
                                    Row(
                                      children: [
                                        KText(
                                          text: '\$${items['productPrice']}',
                                          fontFamily: bold,
                                          fontSize: 14,
                                        ),
                                        SizedBox(width: 5),
                                        KText(
                                          text: '\$${item['discountPrice']}',
                                          fontFamily: regular,
                                          decoration:
                                              TextDecoration.lineThrough,
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
                  );
                }),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
