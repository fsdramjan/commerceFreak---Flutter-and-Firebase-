import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_upload_firebase/src/controllers/BaseController.dart';
import 'package:image_upload_firebase/src/widgets/kText.dart';

class ProfilePage extends StatelessWidget with BaseController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: userC.getCurrentUserData(),
          builder: (context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            final userData = snapshot.data?.data();

            return ListView(
              children: [
                Container(
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: Get.width,
                            height: 220,
                            // color: Colors.red,
                          ),
                          Positioned(
                            right: 2,
                            left: 2,
                            top: 0,
                            child: Container(
                              width: Get.width,
                              height: 140,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black12,
                                ),

                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                // color: Colors.blueGrey,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: userData!['coverImage'] != null
                                    ? CachedNetworkImage(
                                        imageUrl: '${userData['coverImage']}',
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Center(
                                          child: CircularProgressIndicator(
                                              backgroundColor: Colors.brown,
                                              value: downloadProgress.progress),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      )
                                    : Container(),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 100,
                            right: 10,
                            child: InkWell(
                              onTap: () {
                                userC.pickCoverImage();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 110),
                                child: CircleAvatar(
                                  radius: 17,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 14,
                                    backgroundColor: Colors.grey[200],
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 60,
                            child: Container(
                              child: CircleAvatar(
                                radius: 75,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 70,
                                  backgroundColor: Colors.blue,
                                  child: CircleAvatar(
                                    radius: 65,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      radius: 61,
                                      backgroundColor: Colors.black,
                                      child: CircleAvatar(
                                        radius: 60.50,
                                        backgroundColor: Colors.white,
                                        child: userData['profileImage'] != null
                                            ? CachedNetworkImage(
                                                imageUrl:
                                                    '${userData['profileImage']}',
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
                                                  value:
                                                      downloadProgress.progress,
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
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
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 150,
                            child: InkWell(
                              onTap: () {
                                userC.pickProfileImage();
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 120),
                                child: CircleAvatar(
                                  radius: 17,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 14,
                                    backgroundColor: Colors.grey[200],
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                KText(
                                  text: '${userData['name']} ',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                userData['bio'] != null
                                    ? KText(
                                        text: '(${userData['nickName']})',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      )
                                    : Container(),
                              ],
                            ),
                            SizedBox(height: 10),
                            userData['bio'] != null
                                ? KText(
                                    text: '${userData['bio']}',
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black.withOpacity(.60),
                                    textAlign: TextAlign.center,
                                    maxLines: 5,
                                    fontSize: 13,
                                  )
                                : TextButton(
                                    onPressed: () {},
                                    child: KText(text: 'Add Bio'),
                                  ),
                            SizedBox(height: 20),
                            Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 13),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 7,
                                      child: Icon(
                                        Icons.add,
                                        size: 15,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  KText(
                                    text: 'Add to Story',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[350],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 13),
                                          child: Icon(
                                            Icons.edit,
                                            size: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        KText(
                                          text: 'Edit Profile',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 4),
                                Container(
                                  alignment: Alignment.center,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[350],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 13),
                                    child: Icon(
                                      Icons.more_horiz,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
