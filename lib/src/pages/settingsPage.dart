import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_freak/src/authentication/Auth.dart';
import 'package:ecommerce_freak/src/controllers/BaseController.dart';
import 'package:ecommerce_freak/src/pages/profilePage.dart';
import 'package:ecommerce_freak/src/widgets/kText.dart';

class SettingsPage extends StatelessWidget with BaseController {
  final _ = Get.put(AuthenticateC(), permanent: true);

  final listtilePadding = EdgeInsets.only(left: 20, right: 35);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blueGrey,
                        Colors.blue,
                      ],
                      end: Alignment.bottomLeft,
                      begin: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: StreamBuilder(
                      stream: userC.getCurrentUserData(),
                      builder: (context,
                          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }

                        final userData = snapshot.data?.data();
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 10),
                            ListTile(
                              onTap: () {
                                Get.to(ProfilePage());
                              },
                              leading: CircleAvatar(
                                radius: 25,
                                child: userData!['profileImage'] != null
                                    ? CachedNetworkImage(
                                        imageUrl: '${userData['profileImage']}',
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        progressIndicatorBuilder: (
                                          context,
                                          url,
                                          downloadProgress,
                                        ) =>
                                            CircularProgressIndicator(
                                          value: downloadProgress.progress,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(
                                          Icons.error,
                                        ),
                                      )
                                    : Icon(
                                        Icons.person,
                                        size: 100,
                                        color: Colors.blue,
                                      ),
                              ),
                              title: KText(
                                text: '${userData['name']}',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              subtitle: KText(
                                text: 'View & Edit Profile',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                              ),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 45,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // SizedBox(width: 40),
                                          KText(
                                            text: 'Switch Account',
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 45,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.white54),
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          // SizedBox(width: 25),
                                          KText(
                                            text: 'Dark Mode ',
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        );
                      }),
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Padding(
                    padding: listtilePadding,
                    child: listTile(
                      () {},
                      'Notifications',
                      'Check your latest notifications',
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade200,
                  ),
                  Padding(
                    padding: listtilePadding,
                    child: listTile(
                      () {},
                      'Settings',
                      'Set your preferred settings',
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade200,
                  ),
                  Padding(
                    padding: listtilePadding,
                    child: listTile(
                      () {},
                      'Privacy Policy',
                      'Check our latest privacy & policy',
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade200,
                  ),
                  Padding(
                    padding: listtilePadding,
                    child: listTile(
                      () {},
                      'Terms & Conditions',
                      'Check our latest terms & conditions',
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade200,
                  ),
                  Padding(
                    padding: listtilePadding,
                    child: listTile(
                      () => Get.defaultDialog(
                        radius: 30,
                        title: 'Contact Us',
                        titleStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        middleText: 'Send us a message to our team',
                        middleTextStyle: TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                          fontWeight: FontWeight.w700,
                        ),
                        actions: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade50,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  SizedBox(height: 10),
                                  Image.asset(
                                    'assets/img/yahoo.png',
                                    width: 30,
                                  ),
                                  SizedBox(height: 10),
                                  KText(
                                    text: 'Yahoo',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade50,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  SizedBox(height: 10),
                                  Image.asset(
                                    'assets/img/gmail1.png',
                                    width: 30,
                                  ),
                                  SizedBox(height: 10),
                                  KText(
                                    text: 'Gmail',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade50,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  SizedBox(height: 10),
                                  Image.asset(
                                    'assets/img/outlook.png',
                                    width: 30,
                                  ),
                                  SizedBox(height: 10),
                                  KText(
                                    text: 'Outlook',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      'Contact Us',
                      'Send us a message if u need help',
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade200,
                  ),
                ],
              ),
              ListTile(
                onTap: () {
                  _.signOut();
                },
                leading: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: KText(
                    text: 'Logout',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listTile(
    void Function()? onTap,
    String text,
    String subText,
  ) {
    return ListTile(
      onTap: onTap,
      subtitle: KText(
        text: subText,
        color: Colors.black54,
        fontWeight: FontWeight.normal,
        fontSize: 11,
      ),
      title: KText(
        text: text,
        fontWeight: FontWeight.w700,
        fontSize: 15,
      ),
      trailing: Container(
        width: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black54.withOpacity(.05),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
        ),
      ),
    );
  }
}
