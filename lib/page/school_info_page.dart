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
  List PagedData = [
    SchoolListInfo.schoolSlList,
    SchoolListInfo.schoolYhList,
    SchoolListInfo.schoolQzList,
    SchoolListInfo.schoolJxList
  ];

  @override
  Widget build(BuildContext context) {
    var index = Get.arguments;
    return Scaffold(
        body: BaseBgPage(
      pagesData: PagedData[index],
    ));
  }
}
