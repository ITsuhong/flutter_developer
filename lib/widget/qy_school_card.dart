import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_developer/model/school.dart';
import 'package:flutter_developer/theme/theme_colors.dart';
import 'package:flutter_developer/utils/HexColor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class QYSchoolCard extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _SchoolCardState();
  }
}

class _SchoolCardState extends State<QYSchoolCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/school_info',
            arguments: {'name': "青羊二区"});
        // showCode.value = true;
      },
      child: Container(
        decoration: BoxDecoration(
            color: ThemeColors.schoolCardBg.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8)),
        width: 416.w,
        height: 635.h,
        child: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  bottom: -4,
                  // left: null,
                  // right: null,
                  child: Image.asset('assets/images/school_text_bg.png',
                      width: 198.w, height: 45.h),
                ),
                Text(
                 "青羊二区",
                  style: TextStyle(
                      fontSize: 35.sp,
                      color: ThemeColors.schoolCardTitle,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 28.w, right: 28.w, top: 36.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/school/primary/9.jpg",
                  fit: BoxFit.fill,
                  width: 360.w,
                  height: 180.h,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 33.h, left: 10.w, right: 10.w),
              child: Center(
                child: Text(
                 "成都顶级学区",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 27.sp,

                    // textBaseline: ,
                    color: ThemeColors.schoolCardTitle,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                  constraints: BoxConstraints(maxWidth: 400.w),
                  padding: EdgeInsets.only(bottom: 50.h, top: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                              ),
                              Text(
                               "8所小学，4所初中",
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    color: ThemeColors.schoolCardPrimaryTitle),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "五朵金花、三小联中",
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    color: ThemeColors.schoolCardPrimaryTitle),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Text(
                                    "成交区间：",
                                    style: TextStyle(
                                        fontSize: 24.sp,
                                        color: ThemeColors.schoolCardTitle),
                                  ),
                                  Positioned(
                                    child: Image.asset(
                                      'assets/images/school_title_bg.png',
                                      height: 3.h,
                                      fit: BoxFit.fill,
                                    ),
                                    left: 0,
                                    right: 0,
                                    bottom: -2,
                                  )
                                ],
                              ),
                              Text(
                                "50-540万",
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    color: ThemeColors.schoolCardPrimaryTitle),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Text(
                                    "成交总均价：",
                                    style: TextStyle(
                                        fontSize: 24.sp,
                                        color: ThemeColors.schoolCardTitle),
                                  ),
                                  Positioned(
                                    child: Image.asset(
                                      'assets/images/school_title_bg.png',
                                      height: 3.h,
                                      fit: BoxFit.fill,
                                    ),
                                    left: 0,
                                    right: 0,
                                    bottom: -2,
                                  )
                                ],
                              ),
                              Text(
                                "175万	",
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    color: ThemeColors.schoolCardPrimaryTitle),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
