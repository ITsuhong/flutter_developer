import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_developer/page/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_developer/AppPages%20.dart';
import 'package:get/get.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart'
    show BMFMapSDK, BMF_COORD_TYPE;

import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart'
    show BMFMapSDK, BMF_COORD_TYPE;
import 'dart:io' show Platform;

void main() async {

  // 在启动应用程序之前设置拦截器
  // Request.setupInterceptors();
  runApp(const MyApp());
  LocationFlutterPlugin myLocPlugin = LocationFlutterPlugin();

  /// 设置用户是否同意SDK隐私协议
  /// since 3.1.0 开发者必须设置
  // BMFMapSDK.setAgreePrivacy(true);
  // myLocPlugin.setAgreePrivacy(true);

  // 百度地图sdk初始化鉴权
  // if (Platform.isIOS) {
  //   myLocPlugin.authAK('ksCyBmGY51ENoifzphJDpph9wa7E5tFl');
  //   BMFMapSDK.setApiKeyAndCoordType(
  //       'ksCyBmGY51ENoifzphJDpph9wa7E5tFl', BMF_COORD_TYPE.BD09LL);
  // } else if (Platform.isAndroid) {
  //   /// 初始化获取Android 系统版本号，如果低于10使用TextureMapView 等于大于10使用Mapview
  //   await BMFAndroidVersion.initAndroidVersion();
  //   // Android 目前不支持接口设置Apikey,
  //   // 请在主工程的Manifest文件里设置，详细配置方法请参考官网(https://lbsyun.baidu.com/)demo
  //   BMFMapSDK.setCoordType(BMF_COORD_TYPE.BD09LL);
  // }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: (_, child) {
        return GetMaterialApp(
          getPages: AppPages.routes,
          // home: basePage(),
          initialRoute: '/',
        );
      },
    );
  }
}
