import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_developer/widget/marquee.dart';

class ScrollBarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollBarWidgetState();
  }
}

class ScrollBarWidgetState extends State<ScrollBarWidget> {
  bool isShow = false;
  String text =
      "免责声明：本设备旨在对项目周边规划学校等教育资源提供相关信息，并不意味着制作方或开发商对就学安排作出承诺，教育资源的名称、办学性质、办学规模、学位设置、开学（班）时间、招生条件、收费标准及招生区域等存在调整的可能，就学招生政策应以教育主管部门及学校颁布的政策规定为准";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        isShow = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 20,
      child: Marquee(
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        speed: 60,
      ),
    );
  }
}
