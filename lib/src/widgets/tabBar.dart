import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_upload_firebase/src/configs/appColors.dart';
import 'package:image_upload_firebase/src/pages/profilePage.dart';
import 'package:image_upload_firebase/src/pages/settingsPage.dart';

import 'kText.dart';

class TabbarCustom extends StatefulWidget {
  const TabbarCustom({Key? key}) : super(key: key);

  @override
  _TabbarCustomState createState() => _TabbarCustomState();
}

class _TabbarCustomState extends State<TabbarCustom>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // int _currentTab = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

//

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: Get.height,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabBar(
                    labelStyle: TextStyle(
                      fontFamily: medium,
                      fontSize: 14,
                    ),
                    indicatorColor: black,
                    indicatorWeight: 1,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    tabs: [
                      Tab(
                        text: 'Description',
                      ),
                      Tab(
                        text: 'Review',
                      ),
                      Tab(
                        text: 'Comment',
                      ),
                    ],
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        description(),
                        ProfilePage(),
                        SettingsPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget description() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Expanded(
            child: KText(
              text:
                  '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elementum enim et nisl maximus facilisis. Mauris vulputate turpis velit, tristique vulputate lectus mollis a. Cras turpis erat, ultrices vitae dictum in, congue in magna. Cras vestibulum, augue sed porttitor pharetra, justo metus sodales urna, at tempus nunc felis eu nisl. Proin blandit blandit odio quis consequat. Nunc quis nisi ex. Curabitur eget pulvinar purus. Quisque id velit nunc. Integer porttitor mi non faucibus viverra. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sed risus condimentum enim molestie auctor ac a odio.''',
              maxLines: 1000,
              color: black87,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
