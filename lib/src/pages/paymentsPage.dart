import 'package:ecommerce_freak/src/UIelements/topBarElements.dart';
import 'package:ecommerce_freak/src/configs/appColors.dart';
import 'package:ecommerce_freak/src/controllers/paymentController.dart';
import 'package:ecommerce_freak/src/helpers/cardDateValidation.dart';
import 'package:ecommerce_freak/src/helpers/cardNumberValidation.dart';
import 'package:ecommerce_freak/src/widgets/kText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({Key? key}) : super(key: key);

  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  bool value = false;
  SingingCharacter? _character = SingingCharacter.credit;

  final List<SingingCharacter> singingCharacter = [
    SingingCharacter.credit,
    SingingCharacter.bkash,
    SingingCharacter.nagad,
    SingingCharacter.paypal,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backButton(),
        title: centerText('PAYMENT'),
        actions: [
          moreOptionTopBar(),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              KText(
                text: 'Payment Method',
                color: black,
                fontSize: 14,
                fontFamily: bold,
              ),
              SizedBox(height: 10),
              ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                itemCount: paymentData.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = paymentData[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            height: 80,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    left: 10,
                                    child: Image.asset(
                                      '${item['payImage']}',
                                      width: 70,
                                    ),
                                  ),
                                  Positioned(
                                    left: 90,
                                    child: Container(
                                      height: 40,
                                      width: .50,
                                      color: grey.withOpacity(.50),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          KText(
                                            text: '${item['payName']}',
                                            fontSize: 14,
                                            color: black87,
                                            fontFamily: medium,
                                          ),
                                          KText(
                                            text: '${item['payNumber']}',
                                            fontFamily: medium,
                                            color: black54,
                                            fontSize: 12,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Radio<SingingCharacter>(
                          value: singingCharacter[index],
                          activeColor: buttonColor,
                          groupValue: _character,
                          onChanged: (SingingCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              KText(
                text: 'Card Number',
                color: black,
                fontSize: 14,
                fontFamily: medium,
              ),
              SizedBox(height: 5),
              SizedBox(
                height: 45,
                child: TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CardNumberFormatter(),
                  ],
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: '11 22 33 44 55',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: medium,
                      color: black54,
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/img/pay_credit.png',
                        width: 20,
                      ),
                    ),
                    fillColor: white,
                    filled: true,
                    contentPadding: EdgeInsets.only(top: 20, left: 20),
                    counterText: '',
                  ),
                  maxLength: 31,
                ),
              ),
              SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                KText(
                                  text: 'Expire Date',
                                  color: black,
                                  fontSize: 14,
                                  fontFamily: medium,
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  height: 45,
                                  child: TextFormField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      DateFormatter(),
                                    ],
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      hintText: '20/03/2025',
                                      hintStyle: TextStyle(
                                        fontSize: 12,
                                        fontFamily: medium,
                                        color: black54,
                                      ),
                                      prefixIcon: Icon(
                                        Icons.calendar_today,
                                        size: 15,
                                      ),
                                      fillColor: white,
                                      filled: true,
                                      counterText: '',
                                    ),
                                    maxLength: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                KText(
                                  text: 'CVC',
                                  color: black,
                                  fontSize: 14,
                                  fontFamily: medium,
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  height: 45,
                                  child: TextFormField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      DateFormatter(),
                                    ],
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        size: 15,
                                      ),
                                      hintText: '******',
                                      hintStyle: TextStyle(
                                        fontSize: 12,
                                        fontFamily: medium,
                                        color: black54,
                                      ),
                                      fillColor: white,
                                      filled: true,
                                      counterText: '',
                                    ),
                                    maxLength: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 140),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 115,
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
                  KText(
                    text: 'Total : ',
                    fontFamily: medium,
                    fontSize: 14,
                    color: black87,
                  ),
                  KText(
                    text: '\$800.00',
                    fontFamily: bold,
                    fontSize: 15,
                    color: black87,
                  ),
                ],
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () => Get.to(PaymentsPage()),
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
                        text: 'Payment',
                        color: white,
                        fontSize: 14,
                        fontFamily: medium,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
