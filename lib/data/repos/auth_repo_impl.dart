import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/data/models/requests/register_request.dart';
import 'package:ecommerce_app/data/models/responses/auth_response.dart';
import 'package:ecommerce_app/domain/repos/auth_repo.dart';

import '../../utils/api_constants.dart';

class AuthRepoImpl extends AuthRepo {
  late Dio dio;

  AuthRepoImpl(this.connectivity) {
    final options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
    dio.interceptors.add(LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true));
  }

  Connectivity connectivity;

  @override
  Future<Either<Failure, bool>> login(
      {required String email, required String password}) async {
    final ConnectivityResult connectivityResult =
        await (connectivity.checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      try {
        Response serverResponse = await dio.post(ApiConstants.loginEndPoint,
            data: {"email": email, "password": password});

        AuthResponse loginResponse = AuthResponse.fromJson(serverResponse.data);
        if (serverResponse.statusCode! >= 200 &&
            serverResponse.statusCode! < 300) {
          return const Right(true);
        } else {
          return Left(Failure(loginResponse.message ??
              "Something went wrong, please try again later"));
        }
      } catch (e) {
        return left(Failure("Wrong Email or Password"));
      }
    } else {
      return left(NetworkFailure("Check your Internet Connection !"));
    }
  }

  @override
  Future<Either<Failure, bool>> register({required RegisterRequest data}) async {
    final ConnectivityResult connectivityResult =
    await (connectivity.checkConnectivity());
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile) {
      try {
        Response serverResponse = await dio.post(ApiConstants.registerEndPoint,
            data: data.toJson());
        AuthResponse registerResponse = AuthResponse.fromJson(serverResponse.data);
        if (serverResponse.statusCode! >= 200 &&
            serverResponse.statusCode! < 300) {
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
