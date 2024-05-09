import 'package:flutter_developer/page/find_policy_page.dart';
import 'package:flutter_developer/page/home_page.dart';
import 'package:flutter_developer/page/map_page.dart';
import 'package:flutter_developer/page/mine_page.dart';
import 'package:flutter_developer/page/school_info_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(name: '/', page: () => HomePage()),
    GetPage(name: '/policy', page: () => FindPolicyPage()),
    GetPage(name: '/mine', page: () => MinePage()),
    GetPage(name: '/school_info', page: () => SchoolInfoPage()),
    GetPage(name: '/map', page: () => MapPage()),
  ];
}
