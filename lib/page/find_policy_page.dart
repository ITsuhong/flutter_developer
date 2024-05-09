import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_developer/data/policy_list.dart';
import 'package:flutter_developer/widget/base__bg_page.dart';
import 'package:flutter_developer/widget/keep_alive_wrapper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FindPolicyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FindPolicyPageState();
  }
}

class _FindPolicyPageState extends State<FindPolicyPage> {
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
    return Scaffold(
        body: BaseBgPage(
      pagesData: PolicyList.policyLists,
    ));
  }
}
