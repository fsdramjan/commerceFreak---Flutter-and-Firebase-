import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ecommerce_freak/src/helpers/all_Icons.dart';
import 'package:ecommerce_freak/src/configs/appColors.dart';

class SearchComponent extends StatelessWidget {
  final searchPage = InputDecoration(
    border: InputBorder.none,
    focusedBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide.none,
    ),
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide.none,
    ),
    prefixIcon: Padding(
      padding: EdgeInsets.symmetric(vertical: 17),
      child: SvgPicture.asset(
        searchSvg,
        color: black54,
      ),
    ),
    suffixIcon: Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(5),
      //   border: Border.all(
      //     color: Colors.black12,
      //   ),
      // ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.mic_none,
          size: 20,
        ),
      ),
    ),
    hintText: 'Search here',
    fillColor: white,
    filled: true,
    hintStyle: TextStyle(
      color: black54,
      fontSize: 12,
      fontFamily: medium,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding20,
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  decoration: searchPage,
                ),
              ),
            ),
            SizedBox(width: 10),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: SvgPicture.asset(
                  filterSvg,
                  height: 20,
                  color: black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
