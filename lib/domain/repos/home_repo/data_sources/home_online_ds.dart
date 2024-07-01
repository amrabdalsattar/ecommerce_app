import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/responses/home_responses/products_response.dart';

import '../../../../data/models/failure.dart';
import '../../../../data/models/responses/home_responses/categories_response.dart';

abstract class HomeOnlineDs{
  Future<Either<Failure, List<CategoryDM>>> getCategories();

  Future<Either<Failure, List<Product>>> getProducts();
}