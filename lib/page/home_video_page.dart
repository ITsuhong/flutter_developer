import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../theme/theme_colors.dart';
import '../utils/HexColor.dart';

class HomeVideoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeVideoPageState();
  }
}

class _HomeVideoPageState extends State<HomeVideoPage>
    with AutomaticKeepAliveClientMixin {
  late VideoPlayerController _controller;
  var isInit = false;
  var playState = 'pause'.obs;
  var isFirst = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset('assets/video/home.mp4')
      ..initialize().then((_) {
        isInit = true;
        _controller.setLooping(true);

        setState(() {
          playState.value = 'play';
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return VisibilityDetector(
        key: Key("1"),
        child: GestureDetector(
          onTap: () {
            if (_controller.value.isPlaying) {
              _controller.pause();
              playState.value = 'pause';
            } else {
              _controller.play();
              playState.value = 'play';
            }
          },
          child: Stack(
            children: [
              Container(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: _controller.value.isInitialized
                    ? FittedBox(
                        fit: BoxFit.contain,
                        child: SizedBox(
                          width: _controller.value.size.width,
                          height: _controller.value.size.height,
                          child: VideoPlayer(_controller),
                        ),
                      )
                    : Center(
                        child: Text(
                          "加载中",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
              ),
              Center(
                child: Obx(() => playState.value == 'play'
                    ? SizedBox()
                    : Image.asset(
                        'assets/images/icon_play.png',
                        width: 100,
                        height: 100,
                      )),
              ),
              Positioned(
                  left: 54,
                  top: 100,
                  // bottom: MediaQuery.of(context).size.height * 0.4,
                  child: Opacity(
                    opacity: 0.8,
                    child: Container(
                      padding: const EdgeInsets.only(top: 0.7, bottom: 0.7),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            HexColor('#E0C89D'),
                            HexColor('#136968'),
                            HexColor('#E0C89D'),
                          ],
                          // begin: Alignment.topCenter,
                          // end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        width: 550.w,
                        height: 510.h,
                        decoration: BoxDecoration(color: HexColor("#365951")
                            // color: Color.fromRGBO(47, 83, 79)
                            ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("成都5朵金花",

                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30.sp,
                                        color: ThemeColors
                                            .schoolCardPrimaryTitle)),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: new Border.all(
                                        color:
                                            ThemeColors.schoolCardPrimaryTitle,
                                        width: 0.5),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 3,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color:
                                            ThemeColors.schoolCardPrimaryTitle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        border: new Border.all(
                                            color: ThemeColors
                                                .schoolCardPrimaryTitle,
                                            width: 0.5),
                                      ),
                                    ),
                                  ),
                                  // child: ,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("溜爸40强 TOP1",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30.sp,
                                        color: ThemeColors
                                            .schoolCardPrimaryTitle)),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: new Border.all(
                                        color:
                                            ThemeColors.schoolCardPrimaryTitle,
                                        width: 0.5),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 3,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color:
                                            ThemeColors.schoolCardPrimaryTitle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        border: new Border.all(
                                            color: ThemeColors
                                                .schoolCardPrimaryTitle,
                                            width: 0.5),
                                      ),
                                    ),
                                  ),
                                  // child: ,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("百年“老店”，底蕴深厚",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30.sp,
                                        color: ThemeColors
                                            .schoolCardPrimaryTitle)),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: new Border.all(
                                        color:
                                            ThemeColors.schoolCardPrimaryTitle,
                                        width: 0.5),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 3,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color:
                                            ThemeColors.schoolCardPrimaryTitle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        border: new Border.all(
                                            color: ThemeColors
                                                .schoolCardPrimaryTitle,
                                            width: 0.5),
                                      ),
                                    ),
                                  ),
                                  // child: ,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("市中心摩珂池公园中的小学",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30.sp,
                                        color: ThemeColors
                                            .schoolCardPrimaryTitle)),
                                Container(
                                  margin: EdgeInsets.only(left: 5),
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: new Border.all(
                                        color:
                                            ThemeColors.schoolCardPrimaryTitle,
                                        width: 0.5),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 3,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color:
                                            ThemeColors.schoolCardPrimaryTitle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        border: new Border.all(
                                            color: ThemeColors
                                                .schoolCardPrimaryTitle,
                                            width: 0.5),
                                      ),
                                    ),
                                  ),
                                  // child: ,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  right: 54,
                  top: 100,
                  // bottom: MediaQuery.of(context).size.height * 0.4,
                  child: Opacity(
                    opacity: 0.8,
                    child: Container(
                      padding: const EdgeInsets.only(top: 0.7, bottom: 0.7),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            HexColor('#E0C89D'),
                            HexColor('#136968'),
                            HexColor('#E0C89D'),
                          ],
                          // begin: Alignment.topCenter,
                          // end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        width: 550.w,
                        height: 510.h,
                        decoration: BoxDecoration(color: HexColor("#365951")
                            // color: Color.fromRGBO(47, 83, 79)
                            ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: new Border.all(
                                        color:
                                            ThemeColors.schoolCardPrimaryTitle,
                                        width: 0.5),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 3,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color:
                                            ThemeColors.schoolCardPrimaryTitle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        border: new Border.all(
                                            color: ThemeColors
                                                .schoolCardPrimaryTitle,
                                            width: 0.5),
                                      ),
                                    ),
                                  ),
                                  // child: ,
                                ),
                                Text("成都家长的热门之选",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30.sp,
                                        color: ThemeColors
                                            .schoolCardPrimaryTitle)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                    border: new Border.all(
                                        color:
                                        ThemeColors.schoolCardPrimaryTitle,
                                        width: 0.5),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 3,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color:
                                        ThemeColors.schoolCardPrimaryTitle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        border: new Border.all(
                                            color: ThemeColors
                                                .schoolCardPrimaryTitle,
                                            width: 0.5),
                                      ),
                                    ),
                                  ),
                                  // child: ,
                                ),
                                Text("穿越低迷周期，房价逆势上扬",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30.sp,
                                        color: ThemeColors
                                            .schoolCardPrimaryTitle)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                    border: new Border.all(
                                        color:
                                        ThemeColors.schoolCardPrimaryTitle,
                                        width: 0.5),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 3,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color:
                                        ThemeColors.schoolCardPrimaryTitle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        border: new Border.all(
                                            color: ThemeColors
                                                .schoolCardPrimaryTitle,
                                            width: 0.5),
                                      ),
                                    ),
                                  ),
                                  // child: ,
                                ),
                                Text("强流动性，最低成交仅6天",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 30.sp,
                                        color: ThemeColors
                                            .schoolCardPrimaryTitle)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 5),
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                    border: new Border.all(
                                        color:
                                        ThemeColors.schoolCardPrimaryTitle,
                                        width: 0.5),
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 3,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color:
                                        ThemeColors.schoolCardPrimaryTitle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        border: new Border.all(
                                            color: ThemeColors
                                                .schoolCardPrimaryTitle,
                                            width: 0.5),
                                      ),
                                    ),
                                  ),
                                  // child: ,
                                ),
                                Text("最低挂户门槛150万+",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                        fontSize: 30.sp,
                                        color: ThemeColors
                                            .schoolCardPrimaryTitle)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
        onVisibilityChanged: (value) {
          if (value.visibleFraction == 1.0) {
            _controller.play();
            playState.value = 'play';
          } else {
            _controller.pause();
            playState.value = 'pause';
          }
        });
  }

  void playOrPauseVideo() {
    //
    if (!_controller.value.isPlaying) {
      setState(() {
        _controller.play();
      });
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
