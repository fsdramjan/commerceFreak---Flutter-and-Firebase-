import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecommerce_freak/src/UIelements/primaryButton.dart';
import 'package:ecommerce_freak/src/UIelements/topBarElements.dart';
import 'package:ecommerce_freak/src/configs/appColors.dart';
import 'package:ecommerce_freak/src/controllers/BaseController.dart';

import 'package:ecommerce_freak/src/pages/paymentsPage.dart';
import 'package:ecommerce_freak/src/widgets/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductPage extends StatefulWidget with BaseController {
  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> with BaseController {
  final _formKey = GlobalKey<FormState>();

  String? selectedValue;

  List<String> items = [
    'Shoes',
    'Laptop',
    'Mobile',
    'Computer',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor,
        leading: backButton(),
        title: centerText('Add Product'),
        actions: [
          shoppingBagTopBar(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: padding20,
          child: Form(
            key: _formKey,
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      customTextFormField(
                        'Title',
                        'Product Title',
                        Icons.title_rounded,
                        allProductC.productTitle,
                        TextInputType.multiline,
                      ),
                      SizedBox(height: 10),
                      customTextFormField(
                        'Price',
                        'Product Price',
                        Icons.monetization_on,
                        allProductC.productPrice,
                        TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      customTextFormField(
                        'Discount',
                        'Product Discount',
                        Icons.money_off,
                        allProductC.productDiscount,
                        TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      customTextFormField(
                        'Category',
                        'Product Category',
                        Icons.list,
                        allProductC.productCatagory,
                        TextInputType.name,
                      ),
                      SizedBox(height: 10),
                      customTextFormField(
                        'Size',
                        'Product Size',
                        Icons.margin,
                        allProductC.productSize,
                        TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      customTextFormField(
                        'Description',
                        'Product Description',
                        Icons.file_present,
                        allProductC.productdescription,
                        TextInputType.multiline,
                      ),
                      SizedBox(height: 10),
                      categoryDropMenu(),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                allProductC.pickProductImage();
                              },
                              child: Container(
                                // height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: buttonColor.withOpacity(.20),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.image_outlined,
                                        color: black,
                                      ),
                                      KText(
                                        text: 'Gallery',
                                        fontSize: 12,
                                        color: black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                // height: 45,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: buttonColor.withOpacity(.20),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.camera_alt_outlined,
                                        color: black,
                                      ),
                                      KText(
                                        text: 'Camera',
                                        fontSize: 12,
                                        color: black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        // height: 70,
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
          child: GestureDetector(
            onTap: () => Get.to(PaymentsPage()),
            child: primaryButton(
              () {
                // if (_formKey.currentState!.validate()) {
                allProductC.addProducts(context);
                // }
              },
              'Add Product',
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextFormField(
    String? productTitle,
    String? validatorText,
    IconData? icon,
    void Function(String)? onChanged,
    TextInputType? textInputType,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: grey.withOpacity(.20)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $validatorText';
          }
          return '';
        },
        keyboardType: textInputType,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            icon,
            size: 12,
          ),
          hintText: productTitle,
          fillColor: white,
          filled: true,
          hintStyle: TextStyle(
            color: black54,
            fontSize: 12,
            fontFamily: medium,
          ),
        ),
      ),
    );
  }

  Widget categoryDropMenu() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: buttonColor.withOpacity(.20),
        ),
      ),
      // color: white,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          hint: Row(
            children: [
              Icon(
                Icons.list,
                size: 16,
                color: black,
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: KText(
                  text: ' Select Category',
                  color: black,
                ),
              ),
            ],
          ),
          items: items
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: buttonColor.withOpacity(.20),
                      ),
                    ),
                    child: KText(
                      text: item,
                      color: black,
                    ),
                  ),
                ),
              )
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          icon: Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: black,
          iconDisabledColor: Colors.grey,
          buttonHeight: 50,
          buttonWidth: 160,
          buttonPadding: EdgeInsets.only(left: 14, right: 14),
          // buttonDecoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(5),
          // border: Border.all(
          //   color: buttonColor,
          // ),
          //   // color: white,
          // ),
          buttonElevation: 2,
          itemHeight: 40,
          itemWidth: 200,
          itemPadding: EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            // color: Colors.redAccent,
          ),
          // dropdownElevation: 8,
          scrollbarRadius: Radius.circular(40),
          // scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          // offset: Offset(-20, 0),
        ),
      ),
    );
  }
}
