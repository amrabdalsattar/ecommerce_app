import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ThirdPartyModule {
  Connectivity getConnectivity() => Connectivity();

  Dio getDio() => Dio();
}
