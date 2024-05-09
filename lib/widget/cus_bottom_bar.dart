import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_developer/data/bottom_bar.dart';
import 'package:flutter_developer/model/bottom_bar.dart';
import 'package:flutter_developer/theme/theme_colors.dart';
import 'package:flutter_developer/utils/HexColor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

class CusBottomBar extends StatefulWidget {
  final int currentIndex;
  final Function(int index) onTab;

  CusBottomBar({required this.currentIndex, required this.onTab});

  @override
  State<StatefulWidget> createState() {
    return _CusBottomBarState();
  }
}

class _CusBottomBarState extends State<CusBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 1),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          HexColor('#E0C89D'),
          HexColor('#136968'),
          HexColor('#E0C89D'),
        ]),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 83.w, right: 83.w, top: 42.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            HexColor('#285960'),
            HexColor('#2D6268'),
            HexColor('#3D7B7F')
          ]),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  widget.onTab(index);
                },
                child: SizedBox(
                  child: widget.currentIndex == index
                      ? _activeBottomBar(BottomBar.bottomBarList[index], index)
                      : _normalBottomBar(BottomBar.bottomBarList[index], index),
                ),
              );
            })),
      ),
    );
  }

  Widget _normalBottomBar(BottomBarItem data, int index) {
    return Container(
      padding: EdgeInsets.only(bottom: 40.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            data.icon,
            width: 48.w,
            height: 48.w,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              data.title,
              style: TextStyle(
                  color: ThemeColors.bottomBarPrimaryColor,
                  fontSize: 44.sp,
                  letterSpacing: 3),
            ),
          ),
          index < 4
              ? Container(
                  margin: EdgeInsets.only(left: 80.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        stops: const [0, 0.5, 1],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color.fromRGBO(40, 89, 96, 0),
                          HexColor('#E5D4B4'),
                          const Color.fromRGBO(40, 89, 96, 0),
                        ]),
                  ),
                  width: 4.w,
                  height: 70.h,
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget _activeBottomBar(BottomBarItem data, int index) {
    return Container(
      padding: EdgeInsets.only(bottom: 40.h),
      child: Row(
        children: [
          Image.asset(
            data.activeIcon,
            width: 48.w,
            height: 48.w,
          ),
          Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: [
                          HexColor('#E5D4B4'),
                          HexColor('#DCC9A4'),
                          HexColor('#C3A976'),
                          HexColor('#B68F5F'),
                          HexColor('#F1E2C9')
                        ],
                        tileMode: TileMode.mirror,
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcATop,
                    child: Text(
                      data.title,
                      style: TextStyle(fontSize: 44.sp, letterSpacing: 3),
                    ),
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: -6,
                      child: Container(
                        // width: 120.w,
                        height: 3.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            const Color.fromRGBO(40, 89, 96, 0),
                            HexColor('#E5D4B4'),
                            const Color.fromRGBO(40, 89, 96, 0),
                          ]),
                        ),
                      ))
                ],
              )),
          index < 4
              ? Container(
                  margin: EdgeInsets.only(left: 80.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color.fromRGBO(40, 89, 96, 0),
                          HexColor('#E5D4B4'),
                          const Color.fromRGBO(40, 89, 96, 0),
                        ]),
                  ),
                  width: 4.w,
                  height: 70.h,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
