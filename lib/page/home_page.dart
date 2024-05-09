import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_developer/page/about_us_page.dart';
import 'package:flutter_developer/page/find_school_page.dart';
import 'package:flutter_developer/page/home_video_page.dart';
import 'package:flutter_developer/page/school_map_page.dart';
import 'package:flutter_developer/widget/cus_bottom_bar.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  RxInt currentIndex = 0.obs;
  RxBool isPlay = true.obs;
  late PageController _controller;
  List<Widget> pages = [
    HomeVideoPage(),
    SchoolMapPage(),
    FindSchoolPage(),
    HomeVideoPage(),
    AboutUsPage()
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0, keepPage: true);
  }

  onTab(int index) {
    if (index == 3) {
      return Get.toNamed('/policy');
    }
    currentIndex.value = index;
    _controller.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/base_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          PageView.builder(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(), //禁止滑动
            itemCount: pages.length,
            itemBuilder: (context, index) => pages[index],
          ),
        ],
      ),
      bottomNavigationBar: Obx(() => CusBottomBar(
            currentIndex: currentIndex.value,
            onTab: onTab,
          )),
    );
  }
}
