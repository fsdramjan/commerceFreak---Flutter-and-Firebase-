import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackGround extends StatelessWidget {
  final Widget child;
  BackGround({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/img/top1.png',
              // color: Colors.blue,
              width: Get.width,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/img/top2.png',
              // color: Colors.blueAccent,
              width: Get.width,
            ),
          ),
          Positioned(
            top: 50,
            right: 30,
            child: Image.asset(
              'assets/img/main.png',
              width: 140,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/img/bottom1.png',
              width: Get.width,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/img/bottom2.png',
              width: Get.width,
            ),
          ),
          child
        ],
      ),
    );
  }
}
