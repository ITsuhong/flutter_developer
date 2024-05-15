import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_developer/model/school.dart';
import 'package:flutter_developer/theme/theme_colors.dart';
import 'package:flutter_developer/utils/HexColor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SchoolCard extends StatefulWidget {
  final School school;
  final int type;

  SchoolCard({required this.school, required this.type});

  @override
  State<StatefulWidget> createState() {
    return _SchoolCardState();
  }
}

class _SchoolCardState extends State<SchoolCard> {
  RxBool showCode = false.obs;

  @override
  Widget build(BuildContext context) {
    showCode.value = false;
    return Obx(() => showCode.value
        ? GestureDetector(
            onTap: () {
              showCode.value = false;
            },
            child: Container(
              width: 416.w,
              height: 635.h,
              decoration: BoxDecoration(
                  color: HexColor('#0C7786'),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.school.name,
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: ThemeColors.schoolCardTitle,
                    ),
                  ),
                  SizedBox(
                    height: 52.h,
                  ),
                  Image.asset(
                    widget.school.code,
                    height: 208.h,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: 46.h,
                  ),
                  Text(
                    "微信扫二维码",
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "查看学校详细信息",
                    style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              showCode.value = true;
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
                        widget.school.name,
                        style: TextStyle(
                            fontSize: 35.sp,
                            color: ThemeColors.schoolCardTitle,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 28.w, right: 28.w, top: 36.h),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.school.url,
                        fit: BoxFit.fill,
                        width: 360.w,
                        height: 180.h,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: 33.h, left: 10.w, right: 10.w),
                    child: Center(
                      child: Text(
                        widget.school.title,
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
                                      children: [
                                        Text(
                                          "入读方式：",
                                          style: TextStyle(
                                              fontSize: 24.sp,
                                              color:
                                                  ThemeColors.schoolCardTitle),
                                        ),
                                        Positioned(
                                          child: Image.asset(
                                              height: 4.h,
                                              fit: BoxFit.cover,
                                              'assets/images/school_title_bg.png'),
                                          left: 0,
                                          right: 0,
                                          bottom: -2,
                                        )
                                      ],
                                    ),
                                    Text(
                                      widget.school.way,
                                      style: TextStyle(
                                          fontSize: 24.sp,
                                          color: ThemeColors
                                              .schoolCardPrimaryTitle),
                                    )
                                  ],
                                ),
                                if (widget.type < 2)
                                  Row(
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Text(
                                            "学制：",
                                            style: TextStyle(
                                                fontSize: 24.sp,
                                                color: ThemeColors
                                                    .schoolCardTitle),
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
                                        widget.school.system,
                                        style: TextStyle(
                                            fontSize: 24.sp,
                                            color: ThemeColors
                                                .schoolCardPrimaryTitle),
                                      )
                                    ],
                                  ),
                                if (widget.type < 2)
                                  Row(
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Text(
                                            "通勤距离：",
                                            style: TextStyle(
                                                fontSize: 24.sp,
                                                color: ThemeColors
                                                    .schoolCardTitle),
                                          ),
                                          Positioned(
                                            child: Image.asset(
                                                height: 3.h,
                                                fit: BoxFit.fill,
                                                'assets/images/school_title_bg.png'),
                                            left: 0,
                                            right: 0,
                                            bottom: -2,
                                          )
                                        ],
                                      ),
                                      Text(
                                        widget.school.distance,
                                        style: TextStyle(
                                            fontSize: 24.sp,
                                            color: ThemeColors
                                                .schoolCardPrimaryTitle),
                                      )
                                    ],
                                  ),
                                if (widget.type == 2)
                                  Row(
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Text(
                                            "招生（2023）：",
                                            style: TextStyle(
                                                fontSize: 24.sp,
                                                color: ThemeColors
                                                    .schoolCardTitle),
                                          ),
                                          Positioned(
                                            child: Image.asset(
                                                'assets/images/school_title_bg.png'),
                                            left: 0,
                                            right: 0,
                                            bottom: -2,
                                          )
                                        ],
                                      ),
                                      Text(
                                        widget.school.enroll!,
                                        style: TextStyle(
                                            fontSize: 24.sp,
                                            color: ThemeColors
                                                .schoolCardPrimaryTitle),
                                      )
                                    ],
                                  ),
                                if (widget.type == 2)
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.s,
                                    children: [
                                      Row(
                                        children: [
                                          Stack(
                                            clipBehavior: Clip.none,
                                            children: [
                                              Text(
                                                "统招：",
                                                style: TextStyle(
                                                    fontSize: 24.sp,
                                                    color: ThemeColors
                                                        .schoolCardTitle),
                                              ),
                                              Positioned(
                                                child: Image.asset(
                                                    height: 4.h,
                                                    fit: BoxFit.fill,
                                                    'assets/images/school_title_bg.png'),
                                                left: 0,
                                                right: 0,
                                                bottom: -2,
                                              )
                                            ],
                                          ),
                                          Text(
                                            widget.school.unifiedRecruit!,
                                            style: TextStyle(
                                                fontSize: 24.sp,
                                                color: ThemeColors
                                                    .schoolCardPrimaryTitle),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      widget.school.dispens != null
                                          ? Row(
                                              children: [
                                                Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Text(
                                                      "调剂：",
                                                      style: TextStyle(
                                                          fontSize: 24.sp,
                                                          color: ThemeColors
                                                              .schoolCardTitle),
                                                    ),
                                                    Positioned(
                                                      child: Image.asset(
                                                          height: 4.h,
                                                          fit: BoxFit.fill,
                                                          'assets/images/school_title_bg.png'),
                                                      left: 0,
                                                      right: 0,
                                                      bottom: -2,
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  widget.school.dispens!,
                                                  style: TextStyle(
                                                      fontSize: 24.sp,
                                                      color: ThemeColors
                                                          .schoolCardPrimaryTitle),
                                                )
                                              ],
                                            )
                                          : Row(
                                              children: [
                                                Stack(
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Text(
                                                      "平均：",
                                                      style: TextStyle(
                                                          fontSize: 24.sp,
                                                          color: ThemeColors
                                                              .schoolCardTitle),
                                                    ),
                                                    Positioned(
                                                      child: Image.asset(
                                                          height: 4.h,
                                                          fit: BoxFit.fill,
                                                          'assets/images/school_title_bg.png'),
                                                      left: 0,
                                                      right: 0,
                                                      bottom: -2,
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  widget.school.average!,
                                                  style: TextStyle(
                                                      fontSize: 24.sp,
                                                      color: ThemeColors
                                                          .schoolCardPrimaryTitle),
                                                )
                                              ],
                                            )
                                    ],
                                  )
                              ],
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ));
  }
}
