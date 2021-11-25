import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_freak/src/components/allProductComponents.dart';
import 'package:ecommerce_freak/src/components/menuCatagoryComponents.dart';

import 'package:ecommerce_freak/src/components/searchComponent.dart';
import 'package:ecommerce_freak/src/configs/appColors.dart';
import 'package:ecommerce_freak/src/components/carosolSliderComponent.dart';
import 'package:ecommerce_freak/src/pages/cartPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: padding10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.sort,
                        size: 30,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(CartPage()),
                      child: Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: Container(
                          decoration: BoxDecoration(
                              color: pinkAncent.withOpacity(.50),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              color: black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SearchComponent(),
              SizedBox(height: 20),
              CarosolSliderComponent(),
              SizedBox(height: 20),
              MenuCatagoryComponent(),
              SizedBox(height: 20),
              AllProductComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
