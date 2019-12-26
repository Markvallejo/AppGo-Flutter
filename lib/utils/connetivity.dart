import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';

String _connectionStatus = 'Unknown';
final Connectivity _connectivity = Connectivity();

Future connectionType() async {
  ConnectivityResult result;

  try {
    result = await _connectivity.checkConnectivity();
  } on PlatformException catch (e) {
    print(e.toString());
  }

  _updateConnectionStatus(result);
  // print("Estado de la coneccion: $result");
  String estado = result.toString();
  return estado;
}

Future _updateConnectionStatus(ConnectivityResult result) async {
  switch (result) {
    case ConnectivityResult.wifi:
      String wifiName, wifiBSSID, wifiIP;
      try {
        if (Platform.isIOS) {
          LocationAuthorizationStatus status =
              await _connectivity.getLocationServiceAuthorization();
          if (status == LocationAuthorizationStatus.notDetermined) {
            status = await _connectivity.requestLocationServiceAuthorization();
          }
          if (status == LocationAuthorizationStatus.authorizedAlways ||
              status == LocationAuthorizationStatus.authorizedWhenInUse) {
            wifiName = await _connectivity.getWifiName();
          } else {
            wifiName = await _connectivity.getWifiName();
          }
        } else {
          wifiName = await _connectivity.getWifiName();
        }
      } on PlatformException catch (e) {
        print(e.toString());
        wifiName = "Failed to get Wifi Name";
      }

      try {
        if (Platform.isIOS) {
          LocationAuthorizationStatus status =
              await _connectivity.getLocationServiceAuthorization();
          if (status == LocationAuthorizationStatus.notDetermined) {
            status = await _connectivity.requestLocationServiceAuthorization();
          }
          if (status == LocationAuthorizationStatus.authorizedAlways ||
              status == LocationAuthorizationStatus.authorizedWhenInUse) {
            wifiBSSID = await _connectivity.getWifiBSSID();
          } else {
            wifiBSSID = await _connectivity.getWifiBSSID();
          }
        } else {
          wifiBSSID = await _connectivity.getWifiBSSID();
        }
      } on PlatformException catch (e) {
        print(e.toString());
        wifiBSSID = "Failed to get Wifi BSSID";
      }

      try {
        wifiIP = await _connectivity.getWifiIP();
      } on PlatformException catch (e) {
        print(e.toString());
        wifiIP = "Failed to get Wifi IP";
      }
      break;
    case ConnectivityResult.mobile:
      break;
    case ConnectivityResult.none:
      _connectionStatus = result.toString();
      break;

    default:
      _connectionStatus = 'Failed to get connectivity.';
      break;
  }
}
