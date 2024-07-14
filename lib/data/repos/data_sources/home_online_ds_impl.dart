import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/data/models/responses/categories_responses/categories_response.dart';
import 'package:ecommerce_app/data/models/responses/products_responses/products_response.dart';
import 'package:ecommerce_app/utils/networking/api_factory.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/networking/api_constants.dart';
import '../../../domain/repos/data_sources/home_online_ds.dart';

@Injectable(as: HomeOnlineDs)
class HomeOnlineDSImpl extends HomeOnlineDs {
  final ApiFactory api;

  HomeOnlineDSImpl(this.api);

  @override
  Future<Either<Failure, List<CategoryDM>>> getCategories() async {
    final response = await api.get(ApiConstants.getAllCategoriesEndPoint);
    CategoriesResponse categoriesResponse =
        CategoriesResponse.fromJson(response);
    if (categoriesResponse.categories != null ||
        categoriesResponse.categories!.isNotEmpty) {
      return Right(categoriesResponse.categories!);
    } else {
      return Left(Failure(categoriesResponse.message?? "Something went Wrong!"));
    }
  }

  @override
  Future<Either<Failure, List<ProductDM>>> getProducts() async {
    final response = await api.get(ApiConstants.getAllProductsEndPoint);
    ProductsResponse productsResponse = ProductsResponse.fromJson(response);
    if (productsResponse.products != null ||
        productsResponse.products!.isNotEmpty) {
      return Right(productsResponse.products!);
    } else {
      return Left(Failure(productsResponse.message ?? "Something went Wrong!"));
    }
  }
}
