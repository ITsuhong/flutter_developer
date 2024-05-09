import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SchoolMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/school_map_bg.png',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          right: 520.w,
          top: 200.h,
          child: GestureDetector(
            onTap: () {
              Get.toNamed("school_info", arguments: 1);
            },
            child: Image.asset(
              'assets/schoolName/school_yh_icon.png',
              fit: BoxFit.cover,
              height: 130.h,
            ),
          ),
        ),
        Positioned(
          right: 550.w,
          top: 300.h,
          child: GestureDetector(
            onTap: () {
              Get.toNamed("school_info", arguments: 0);
            },
            child: Image.asset(
              'assets/schoolName/school_sl_icon.png',
              fit: BoxFit.cover,
              height: 120.h,
            ),
          ),
        ),
        Positioned(
          right: 560.w,
          top: 420.h,
          child: GestureDetector(
            onTap: () {
              Get.toNamed("school_info", arguments: 2);
            },
            child: Image.asset(
              'assets/schoolName/school_qz_icon.png',
              fit: BoxFit.cover,
              height: 130.h,
            ),
          ),
        ),
        Positioned(
          right: 680.w,
          top: 660.h,
          child: GestureDetector(
            onTap: () {
              Get.toNamed("school_info", arguments: 3);
            },
            child: Image.asset(
              'assets/schoolName/school_jx_icon.png',
              fit: BoxFit.cover,
              height: 140.h,
            ),
          ),
        )
      ],
    );
  }
}
