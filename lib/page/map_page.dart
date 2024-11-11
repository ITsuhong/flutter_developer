import 'package:coordtransform/coordtransform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_developer/data/map.dart';
import 'package:flutter_developer/utils/HexColor.dart';

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapPageState();
  }
}

class _MapPageState extends State<MapPage> {
  late BMFMapController myMapController;
  BMFMapOptions mapOptions = BMFMapOptions(
      // buildingsEnabled:true,
      mapType:BMFMapType.Satellite,
      center: BMFCoordinate(30.669197, 104.060843),
      zoomLevel: 16,
      mapPadding: BMFEdgeInsets(left: 30, top: 0, right: 30, bottom: 0));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: BMFMapWidget(
                onBMFMapCreated: (controller) {
                  print("object");
                  myMapController = controller;


                  /// 坐标点
                  List<BMFPolygon> polygonList = [];
                  for (var value in MapData.data) {
                    List<BMFCoordinate> coordinates = [];
                    for (var position in value) {
                      CoordResult result;
                      result = CoordTransform.transformGCJ02toBD09(
                          position['longitude']!, position['latitude']!);
                      coordinates.add(BMFCoordinate(result.lat, result.lon));
                    }
                    BMFPolygon polygon = BMFPolygon(
                        lineDashType: BMFLineDashType.LineDashTypeDot,
                        coordinates: coordinates,
                        strokeColor: Color.fromRGBO(255, 22, 33, 0.4),
                        width: 2,
                        fillColor: Color.fromRGBO(255, 22, 33, 0.2));
                    polygonList.add(polygon);

                    // print(value[0]);
                  }

                  /// 构造Polygon

                  /// 添加polygon
                  for (var value in polygonList) {
                    myMapController?.addPolygon(value);
                  }

                  Future.delayed(Duration(seconds: 1), () {
                    for (var value in MapData.primary) {
                      CoordResult resultmiddle;
                      resultmiddle = CoordTransform.transformGCJ02toBD09(
                          value.position[1], value.position[0]);
                      BMFMarker marker = BMFMarker.icon(

                          isLockedToScreen: true,
                          position:
                          BMFCoordinate(resultmiddle.lat, resultmiddle.lon),
                          title: 'flutterMaker',
                          titleOptions: BMFTitleOptions(
                              text: value.name,
                              fontSize: 40,
                              fontColor: HexColor("#35a8f3"),
                              // bgColor: Colors.white,
                              titleAnchorY: -1.6),
                          identifier: 'flutter_marker',
                          icon: 'assets/images/nav-primary.png');
                      myMapController?.addMarker(marker);
                    }
                    for (var value in MapData.middle) {
                      CoordResult resultmiddle;
                      resultmiddle = CoordTransform.transformGCJ02toBD09(
                          value.position[1], value.position[0]);
                      BMFMarker marker = BMFMarker.icon(

                          isLockedToScreen: true,
                          position:
                              BMFCoordinate(resultmiddle.lat, resultmiddle.lon),
                          title: 'flutterMaker',
                          titleOptions: BMFTitleOptions(
                              text: value.name,
                              fontSize: 40,
                              fontColor: HexColor("#fff1b8"),
                              // bgColor: Colors.white,
                              titleAnchorY: -1.6),
                          identifier: 'flutter_marker',
                          icon: 'assets/images/nav-middle.png');
                      myMapController?.addMarker(marker);
                    }
                  });
                  myMapController?.setCustomMapStyle(
                      'assets/file/map_style', 0);
                  BMFCustomMapStyleOption customMapStyleOption =
                  BMFCustomMapStyleOption(
                      customMapStyleID: "8cb21a1d90eb926393abba2f69a2a356");
                  myMapController?.setCustomMapStyleWithOptionPath(
                      customMapStyleOption: customMapStyleOption,
                      preload: (String? path) {
                        print("object");
                      },
                      success: (String? path) {
                        print("成功");
                      },
                      error: (int? errorCode, String? path) {
                        print("失败了");
                      });
                  // onBMFMapCreated(controller);
                },
                mapOptions: mapOptions,
              ),
            ),
          ),
        )
      ],
    );
  }
}
