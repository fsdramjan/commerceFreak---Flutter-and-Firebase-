import 'package:flutter/material.dart';

import 'package:ecommerce_freak/src/configs/appColors.dart';
import 'package:ecommerce_freak/src/helpers/all_Icons.dart';
import 'package:ecommerce_freak/src/widgets/kText.dart';

class MenuCatagoryComponent extends StatelessWidget {
  final catagoryMenu = [
    {
      'title': 'Top Categories',
      'image': topCatagory,
    },
    {
      'title': 'Brands',
      'image': brands,
    },
    {
      'title': 'Top Seller',
      'image': topSeller,
    },
    {
      'title': 'Todays Deal',
      'image': todaysDeal,
    },
    {
      'title': 'Flash Deal',
      'image': flashDeal,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: 80,
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            primary: false,
            itemCount: catagoryMenu.length,
            itemBuilder: (BuildContext context, int index) {
              final item = catagoryMenu[index];
              // final icon = iconData[index];
              return Container(
                // color: red,
                width: 80,
                child: Column(
                  children: [
                    // CircleAvatar(
                    //   radius: 20,
                    //   backgroundColor: white,
                    //   child: Padding(
                    //     padding: EdgeInsets.all(10.0),
                    //     child: Image.asset(
                    //       '${item['image']}',
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),

                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.shade200,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Image.asset(
                          '${item['image']}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    KText(
                      text: '${item['title']}',
                      fontSize: 10.20,
                      color: black54,
                      fontFamily: medium,
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
