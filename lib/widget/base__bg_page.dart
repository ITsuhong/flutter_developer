import 'package:flutter/cupertino.dart';
import 'package:flutter_developer/widget/scrollbar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'keep_alive_wrapper.dart';

class BaseBgPage extends StatefulWidget {
  final List pagesData;
  final bool showBack;

  BaseBgPage({required this.pagesData, this.showBack = true});

  @override
  State<StatefulWidget> createState() {
    return _BaseBgPageState();
  }
}

class _BaseBgPageState extends State<BaseBgPage> {
  late PageController _pageController;
  RxInt pageIndex = 0.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/base_bg.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
              onPageChanged: (int index) {
                pageIndex.value = index;
              },
              allowImplicitScrolling: true,
              controller: _pageController,
              itemCount: widget.pagesData.length,
              itemBuilder: (context, index) {
                return KeepAliveWrapper(
                    child: Image.asset(
                  widget.pagesData[index],
                  fit: BoxFit.cover,
                ));
              }),
        )),
        Positioned(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 80.w, right: 55.w, top: 60.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: widget.showBack
                        ? Image.asset(
                            'assets/images/back_home.png',
                            width: 222.w,
                            height: 52.h,
                          )
                        : SizedBox(),
                  ),
                  Image.asset(
                    'assets/images/xqbk_logo.png',
                    width: 167.w,
                    height: 58.h,
                  )
                ],
              ),
            )
          ],
        )),
        Positioned(
            child: Center(
          child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  pageIndex.value > 0
                      ? GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(pageIndex.value - 1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          },
                          child: Image.asset(
                            'assets/images/left_change.png',
                            fit: BoxFit.cover,
                            width: 108.h,
                            height: 108.h,
                          ),
                        )
                      : SizedBox(),
                  pageIndex.value < widget.pagesData.length - 1
                      ? GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(pageIndex.value + 1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          },
                          child: widget.pagesData.length > 1
                              ? Image.asset(
                                  'assets/images/right_change.png',
                                  fit: BoxFit.cover,
                                  width: 108.h,
                                  height: 108.h,
                                )
                              : SizedBox(),
                        )
                      : SizedBox(),
                ],
              )),
        )),
        Positioned(child: ScrollBarWidget(), bottom: 0, left: 0, right: 0),
      ],
    );
  }
}
