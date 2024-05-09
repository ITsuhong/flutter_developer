import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_developer/data/school_list.dart';
import 'package:flutter_developer/widget/school_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FindSchoolPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FindSchoolPageState();
  }
}

class _FindSchoolPageState extends State<FindSchoolPage> {
  PageController _pageController = PageController(initialPage: 0);
  final List<TypeButton> typeButtons = [
    TypeButton(
        activeIcon: 'assets/images/find_school_primary_active.png',
        icon: 'assets/images/find_school_primary.png'),
    TypeButton(
        activeIcon: 'assets/images/find_school_cz_active.png',
        icon: 'assets/images/find_school_cz.png'),
    TypeButton(
        activeIcon: 'assets/images/find_school_gaozhong_active.png',
        icon: 'assets/images/find_school_gaozhong.png'),
  ];

  final List schoolList = [
    SchoolList.primarySchoolLists,
    SchoolList.middleSchoolLists,
    SchoolList.highSchoolLists
  ];

  int activeButton = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  void scrollToStart() {
    _pageController.animateToPage(
      0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          width: MediaQuery.of(context).size.width,
          top: 84.h,
          child: Column(
            children: [
              Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            activeButton = index;
                            scrollToStart();
                          });
                        },
                        child:Container(
                            margin: index == 2
                                ? null
                                : EdgeInsets.only(right: 130.w),
                            child: activeButton == index
                                ? Image.asset(typeButtons[index].activeIcon,
                                width: 290.w, height: 80.h)
                                : Image.asset(typeButtons[index].icon,
                                width: 290.w, height: 80.h)),
                      );
                    })),
              ),
              Container(
                margin: EdgeInsets.only(top: 50.h),
                width: MediaQuery.of(context).size.width,
                height: 635.h,
                child: ListView.builder(
                    controller: _pageController,
                    padding: EdgeInsets.only(left: 70.w),
                    scrollDirection: Axis.horizontal,
                    itemCount: schoolList[activeButton].length,
                    itemExtent: 416.w + 40.w,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 40.w),
                        child: SchoolCard(
                          school: schoolList[activeButton][index],
                        ),
                      );
                    }),
              )
            ],
          )),
      Positioned(
          right: 54.w,
          top: 54.h,
          child: Image.asset(
            width: 166.w,
            height: 58.h,
            'assets/images/xqbk_logo.png',
            fit: BoxFit.cover,
          ))
    ]);
  }
}

class TypeButton {
  final String activeIcon;
  final String icon;

  TypeButton({required this.activeIcon, required this.icon});
}
