import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeVideoPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _HomeVideoPageState();
  }
}

class _HomeVideoPageState extends State<HomeVideoPage> with AutomaticKeepAliveClientMixin{
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
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: _controller.value.isInitialized
                    ? VideoPlayer(_controller)
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
                  right: -4,
                  bottom: MediaQuery.of(context).size.height * 0.4,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed("school_info", arguments: 0);
                    },
                    child: Image.asset(
                      'assets/schoolName/school_sl.png',
                      fit: BoxFit.cover,
                      height: 96.h,
                    ),
                  )),
              Positioned(
                  right: -4,
                  bottom: MediaQuery.of(context).size.height * 0.4 - 100.h,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed("school_info", arguments: 1);
                    },
                    child: Image.asset(
                      'assets/schoolName/school_yh.png',
                      fit: BoxFit.cover,
                      height: 96.h,
                    ),
                  )),
              Positioned(
                  right: -4,
                  bottom: MediaQuery.of(context).size.height * 0.4 - 200.h,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed("school_info", arguments: 2);
                    },
                    child: Image.asset(
                      'assets/schoolName/school_qz.png',
                      fit: BoxFit.cover,
                      height: 96.h,
                    ),
                  )),
              Positioned(
                  right: -4,
                  bottom: MediaQuery.of(context).size.height * 0.4 - 300.h,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed("school_info", arguments: 3);
                    },
                    child: Image.asset(
                      'assets/schoolName/school_jx.png',
                      fit: BoxFit.cover,
                      height: 96.h,
                    ),
                  ))
            ],
          ),
        ),
        onVisibilityChanged: (value) {
         if(value.visibleFraction == 1.0){
           _controller.play();
           playState.value = 'play';
         }else{
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
