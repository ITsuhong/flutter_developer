import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_developer/data/map.dart';

class AmapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AmapPageState();
  }
}

class _AmapPageState extends State<AmapPage> {
  static final LatLng mapCenter = const LatLng(39.909187, 116.397451);
  final Set<Polygon> _polygons = <Polygon>{};
  final Set<Marker> _markers = <Marker>{};


  @override
  void initState() {
    super.initState();
    // _initPolygonsAndMarkers();
  }
  //
  // void _initPolygonsAndMarkers() {
  //
  //   // 创建多边形的顶点
  //   final List<LatLng> points = MapData.data
  //       .map((value) => value.map((e) => LatLng(e['latitude']!, e['longitude']!)))
  //       .expand((e) => e)
  //       .toList();
  //
  //   // 创建多边形
  //   final Polygon polygon = Polygon(
  //     strokeWidth: 0.5,
  //     strokeColor: Color.fromRGBO(255, 22, 33, 0.4),
  //     fillColor: Color.fromRGBO(255, 22, 33, 0.2),
  //     points: points,
  //   );
  //   _polygons.add(polygon);
  //
  //   // 添加标记点
  //   for (var value in MapData.middle) {
  //     final LatLng position = LatLng(value[0], value[1]);
  //     final Marker marker = Marker(position: position);
  //     _markers.add(marker);
  //   }
  // }

  @override
  Widget build(BuildContext context) {



    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: AMapWidget(
              polygons:_polygons,
              markers: _markers,
              initialCameraPosition: const CameraPosition(
                  target: LatLng(30.658204, 104.065833), zoom: 14),
              privacyStatement: AMapPrivacyStatement(
                  hasShow: true, hasAgree: true, hasContains: true),
              apiKey: AMapApiKey(
                  iosKey: '', androidKey: '49599f4bafd060f747a17c4ff4322708'),
              onMapCreated: (mapController) async {
                // _initPolygonsAndMarkers();
              })
        )
      ],
    );
  }
}
