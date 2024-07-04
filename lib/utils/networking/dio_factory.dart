import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/utils/networking/api_constants.dart';
import 'package:ecommerce_app/utils/networking/api_factory.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ApiFactory)
class DioFactory extends ApiFactory {
  final Dio dio;

  DioFactory({required this.dio}) {
    dio.options.baseUrl = ApiConstants.baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 50);
    dio.interceptors.add(LogInterceptor(
      request: false,
      requestHeader: false,
      requestBody: false,
      responseHeader: false,
      responseBody: false,
      error: false,
    ));
  }

  @override
  Future delete(String path,
      {Object? data,
        Map<String, dynamic>? queryParameters,
        bool isFormData = false}) async {
    try {
      final response =
      await dio.delete(path, data: data, queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      Failure(e.toString());
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
      await dio.get(path, data: data, queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      Failure(e.toString());
    }
  }

  @override
  Future patch(String path,
      {Object? data,
        Map<String, dynamic>? queryParameters,
        bool isFormData = false}) async {
    try {
      final response =
      await dio.patch(path, data: data, queryParameters: queryParameters);
      return response.data;
    }catch (e) {
      Failure(e.toString());
    }
  }

  @override
  Future post(String path,
      {Object? data,
        Map<String, dynamic>? queryParameters,
        bool isFormData = false}) async {
    try {
      final response =
      await dio.post(path, data: data, queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      Failure(e.toString());
    }
  }

  @override
  Future put(String path,
      {Object? data,
        Map<String, dynamic>? queryParameters,
        bool isFormData = false}) async {
    try {
      final response =
      await dio.put(path, data: data, queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      Failure(e.toString());
    }
  }
}