import '../model/bottom_bar.dart';

class BottomBar {
  static List<BottomBarItem> bottomBarList = [
    BottomBarItem(
        icon: "assets/bottomBar/home.png",
        activeIcon: "assets/bottomBar/home_active.png",
        title: "HOME",
        path: "/home"),
    BottomBarItem(
        icon: "assets/bottomBar/map.png",
        activeIcon: "assets/bottomBar/map_active.png",
        title: "学区地图",
        path: "/home"),
    BottomBarItem(
        icon: "assets/bottomBar/look_school.png",
        activeIcon: "assets/bottomBar/look_school_active.png",
        title: "查学校",
        path: "/home"),
    BottomBarItem(
        icon: "assets/bottomBar/look_policy.png",
        activeIcon: "assets/bottomBar/look_policy_active.png",
        title: "查政策",
        path: "/home"),
    BottomBarItem(
        icon: "assets/bottomBar/about_us.png",
        activeIcon: "assets/bottomBar/about_us_active.png",
        title: "关于我们",
        path: "/home")
  ];
}
