import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_developer/data/school_info_list.dart';
import 'package:get/get.dart';
import '../widget/base__bg_page.dart';

class SchoolInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SchoolInfoPageState();
  }
}

class _SchoolInfoPageState extends State<SchoolInfoPage> {
  List PagedData = [];

  @override
  Widget build(BuildContext context) {
    String name = Get.arguments['name'];
    print("信息${name}");
    PagedData=SchoolListInfo().getList(name);
    return Scaffold(
        body: BaseBgPage(
      pagesData: PagedData,
    ));
  }
}
