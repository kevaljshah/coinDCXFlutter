import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'connection_status.dart';
import 'dart:io';

class ConnectionService {
  StreamController<Future<ConnectionStatus>> connectionStatusStream = StreamController<Future<ConnectionStatus>>();

  ConnectionService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStatusStream.add(_getConnectionStatus(result));
    });
  }

  Future<ConnectionStatus> _getConnectionStatus(ConnectivityResult result) async {
    final checkConnectivity = await InternetAddress.lookup('google.com');
    final hasInternet = checkConnectivity.isNotEmpty && checkConnectivity[0].rawAddress.isNotEmpty;
    switch (result) {
      case ConnectivityResult.mobile:
        return hasInternet
            ? ConnectionStatus.Cellular
            : ConnectionStatus.ConnectedWithoutInternet;
      case ConnectivityResult.wifi:
        return hasInternet
            ? ConnectionStatus.Wifi
            : ConnectionStatus.ConnectedWithoutInternet;
      case ConnectivityResult.none:
        return ConnectionStatus.Offline;
      default:
        return ConnectionStatus.Offline;
    }
  }
}