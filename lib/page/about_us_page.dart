import 'package:flutter/cupertino.dart';
import 'package:flutter_developer/widget/base__bg_page.dart';

class AboutUsPage extends StatelessWidget {
  List pagesData = ["assets/about_us/1.jpg", "assets/about_us/2.jpg"];

  @override
  Widget build(BuildContext context) {
    return BaseBgPage(
      pagesData: pagesData,
      showBack: false,
    );
  }
}
