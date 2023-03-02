import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../connectivty/statusinternet/status.dart';

class NetworkServices {


  StreamController<NetworkStatus>controller = StreamController();

  NetworkServices() {
    Connectivity().onConnectivityChanged.listen((event) {
      controller.add(_networkStatus(event));
    });
  }
  NetworkStatus _networkStatus(ConnectivityResult connectivityResult) {
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi
        ? NetworkStatus.online
        : NetworkStatus.offline;
  }



}
