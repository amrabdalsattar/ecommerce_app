import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/responses/products_responses/products_response.dart';

import '../../../../data/models/failure.dart';
import '../../../../data/models/responses/categories_responses/categories_response.dart';

abstract class HomeOnlineDs{
  Future<Either<Failure, List<CategoryDM>>> getCategories();

  Future<Either<Failure, List<ProductDM>>> getProducts();

  Future<Either<Failure, List<ProductDM>>> getProductsByCategory(String id);
}