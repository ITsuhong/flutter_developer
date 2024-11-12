import 'package:coordtransform/coordtransform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';
import 'package:flutter_developer/data/map.dart';
import 'package:flutter_developer/utils/HexColor.dart';
import 'package:get/get.dart';

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MapPageState();
  }
}

class _MapPageState extends State<MapPage> {
  late BMFMapController myMapController;

  // 假设 g_map_BMFMarkerID_dwIndex 和 g_listBMFMarker 是全局变量
  Map<dynamic, String> g_map_BMFMarkerID = {};
  List<BMFMarker> g_listBMFMarker = [];
  BMFMapOptions mapOptions = BMFMapOptions(
      // buildingsEnabled:true,
      mapType: BMFMapType.Satellite,
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
                          identifier: value.name,
                          icon: 'assets/images/nav-primary.png');
                      // g_map_BMFMarkerID_dwIndex[marker.getId()] = i;
                      // g_listBMFMarker.add(marker);
                      g_map_BMFMarkerID[marker.toMap()['id']] = value.name;
                      myMapController?.addMarker(marker);
                    }
                    // for (var value in MapData.middle) {
                    //   CoordResult resultmiddle;
                    //   resultmiddle = CoordTransform.transformGCJ02toBD09(
                    //       value.position[1], value.position[0]);
                    //   BMFMarker marker = BMFMarker.icon(
                    //
                    //       isLockedToScreen: true,
                    //       position:
                    //       BMFCoordinate(resultmiddle.lat, resultmiddle.lon),
                    //       title: 'flutterMaker',
                    //       titleOptions: BMFTitleOptions(
                    //           text: value.name,
                    //           fontSize: 40,
                    //           fontColor: HexColor("#fff1b8"),
                    //           // bgColor: Colors.white,
                    //           titleAnchorY: -1.6),
                    //       identifier: value.name,
                    //       icon: 'assets/images/nav-middle.png');
                    //   // print(marker.getId())
                    //   myMapController?.addMarker(marker);
                    //   g_map_BMFMarkerID[marker.toMap()['id']]=value.name;
                    //   // g_listBMFMarker.add(marker);
                    //
                    // }
                  });
                  myMapController!.setMapClickedMarkerCallback(
                      callback: (BMFMarker marker) {
                    // marker.fromMap(map)
                    print('所有标记点${g_map_BMFMarkerID}');
                    print("这是${marker.toMap()['id']}");
                    dynamic _id = marker.toMap()['id'];
                    print("学校${g_map_BMFMarkerID[_id]}");
                    Get.toNamed('/school_info',
                        arguments: {"name": g_map_BMFMarkerID[_id]});
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
