import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_freak/src/configs/appColors.dart';
import 'package:ecommerce_freak/src/helpers/all_Icons.dart';

final List<String> imgList = [
  slider1,
  slider2,
  slider3,
  slider4,
];

class CarosolSliderComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarosolSliderComponent> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 3.50,
            autoPlayCurve: Curves.easeIn,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: _current == entry.key ? 11 : 5,
              height: _current == entry.key ? 5 : 5,
              margin: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 4.0,
              ),
              decoration: _current == entry.key
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : buttonColor)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4))
                  : BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : buttonColor)
                          .withOpacity(
                        _current == entry.key ? 0.9 : 0.4,
                      ),
                    ),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: [
                Image.asset(item, fit: BoxFit.cover, width: Get.width),
                // Positioned(
                //   bottom: 0.0,
                //   left: 0.0,
                //   right: 0.0,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //         colors: [
                //           Color.fromARGB(200, 0, 0, 0),
                //           Color.fromARGB(0, 0, 0, 0)
                //         ],
                //         begin: Alignment.bottomCenter,
                //         end: Alignment.topCenter,
                //       ),
                //     ),
                //     padding: EdgeInsets.symmetric(
                //         vertical: 10.0, horizontal: 20.0),
                //     child: Text(
                //       'No. ${imgList.indexOf(item)} image',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 20.0,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    )
    .toList();
