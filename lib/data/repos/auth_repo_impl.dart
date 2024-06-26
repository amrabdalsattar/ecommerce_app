import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/data_utils/cache_helper.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repos/auth_repo.dart';
import '../../utils/networking/api_constants.dart';
import '../../utils/networking/api_factory.dart';
import '../models/failure.dart';
import '../models/requests/register_request.dart';
import '../models/responses/auth_response.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  final ApiFactory api;

  AuthRepoImpl(this.connectivity, this.api);

  final Connectivity connectivity;

  @override
  Future<Either<Failure, bool>> login(
      {required String email, required String password}) async {
    final List<ConnectivityResult> connectivityResult =
        await (connectivity.checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      final serverResponse = await api.post(ApiConstants.loginEndPoint,
          data: {"email": email, "password": password});
      AuthResponse loginResponse = AuthResponse.fromJson(serverResponse);
      if (loginResponse.token != null) {
        CacheData.setData(key: "user", value: loginResponse.user);
        CacheData.setData(key: "token", value: loginResponse.token);
        return const Right(true);
      } else {
        return Left(Failure(loginResponse.message ??
            "Something went wrong, please try again later"));
      }
    } else {
      return left(NetworkFailure("Check your Internet Connection !"));
    }
  }

  @override
  Future<Either<Failure, bool>> register(
      {required RegisterRequest data}) async {
    final List<ConnectivityResult> connectivityResult =
        await (connectivity.checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      try {
        Response serverResponse =
            await api.post(ApiConstants.registerEndPoint, data: data.toJson());
        AuthResponse registerResponse =
            AuthResponse.fromJson(serverResponse.data);
        if (serverResponse.statusCode! >= 200 &&
            serverResponse.statusCode! < 300) {
          CacheData.setData(key: "user", value: registerResponse.user);
          CacheData.setData(key: "token", value: registerResponse.token);
          return const Right(true);
        } else {
          return Left(Failure(registerResponse.message ??
              "Something went wrong, please try again later"));
        }
      } catch (e) {
        return left(Failure(e.toString()));
      }
    } else {
      return left(NetworkFailure("Check your Internet Connection !"));
    }
  }
}
