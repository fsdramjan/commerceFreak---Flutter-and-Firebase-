import 'package:ecommerce_freak/src/pages/addProductPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce_freak/src/helpers/all_Icons.dart';
import 'package:ecommerce_freak/src/configs/appColors.dart';
import 'package:ecommerce_freak/src/pages/cartPage.dart';
import 'package:ecommerce_freak/src/pages/favoriteProductsPage.dart';

import 'package:ecommerce_freak/src/pages/settingsPage.dart';
import 'package:get/get.dart';

import 'homePage.dart';

class BottomBarHome extends StatefulWidget {
  const BottomBarHome({Key? key}) : super(key: key);

  @override
  _BottomBarHomeState createState() => _BottomBarHomeState();
}

class _BottomBarHomeState extends State<BottomBarHome> {
  int _currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget _currentScreens = HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      body: PageStorage(
        bucket: bucket,
        child: _currentScreens,
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Container(
          height: 65,
          width: 65,
          child: FittedBox(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: buttonColor,
              onPressed: () {},
              child: MaterialButton(
                onPressed: () => Get.to(AddProductPage()),
                child: Icon(
                  Icons.add,
                  color: white,
                ),
                // child: SvgPicture.asset(
                //   _currentTab == 5 ? cameraSvg : cameraSvg,
                //   color: Colors.white,
                //   // color: _currentTab == 5
                //   //     ? buttonColor
                //   //     : black54,
                //   width: 20,
                // ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomSheet: BottomAppBar(
        color: white,
        elevation: 0,
        // shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          // width: Get.width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                spreadRadius: 80,
                blurRadius: 70,
              ),
            ],
          ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _currentScreens = HomePage();
                        _currentTab = 0;
                      });
                    },
                    child: SvgPicture.asset(
                      _currentTab == 0 ? homeRoundSvg : homeSvg,
                      color: _currentTab == 0 ? buttonColor : black54,
                      width: 18,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _currentScreens = CartPage();
                        _currentTab = 1;
                      });
                    },
                    child: SvgPicture.asset(
                      _currentTab == 1 ? shoppingCartSvg : shoppingCartSvg,
                      width: 18,
                      color: _currentTab == 1 ? buttonColor : black54,
                    ),
                  ),
                  SizedBox(width: 40),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _currentScreens = FavoriteProductsPage();
                        _currentTab = 2;
                      });
                    },
                    child: SvgPicture.asset(
                      _currentTab == 2 ? wishlistRoundSvg : wishlistSvg,
                      width: 18,
                      color: _currentTab == 2 ? buttonColor : black54,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _currentScreens = SettingsPage();
                        _currentTab = 3;
                      });
                    },
                    child: SvgPicture.asset(
                      _currentTab == 3 ? userRoundSvg : userSvg,
                      width: 18,
                      color: _currentTab == 3 ? buttonColor : black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
