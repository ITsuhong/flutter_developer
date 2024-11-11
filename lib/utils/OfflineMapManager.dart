import 'dart:ffi';

import 'package:flutter_baidu_mapapi_map/flutter_baidu_mapapi_map.dart';

class OfflineMapManager {
  final OfflineController _offlineController = OfflineController();

  void init() {
    print("进来");
    _offlineController.init();
    _offlineController.onGetOfflineMapStateBack(callback: _onGetOfflineMapStateBack);
  }

  void _onGetOfflineMapStateBack(int? state, int? cityID) {
    switch (state) {
      case OfflineController.TYPE_DOWNLOAD_UPDATE:
        print('下载中');
        // _setUpdateInfo(cityID);
        // 处理下载进度更新提示
        break;

      case OfflineController.TYPE_NEW_OFFLINE:
      // 有新离线地图安装
        break;

      case OfflineController.TYPE_VER_UPDATE:
      // 版本更新提示
      // MKOLUpdateElement e = mOffline.getUpdateInfo(state);
        break;

      default:
        break;
    }
  }



  void startDownload(int cityId) async{
  print("下载");
  List<BMFOfflineCityRecord>? cityList =   await _offlineController?.getOfflineCityList();
  print(cityList?.toList());
    _offlineController.startOfflineMap(cityId);
  }
}