import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/data/models/responses/categories_responses/categories_response.dart';
import 'package:ecommerce_app/data/models/responses/products_responses/products_response.dart';

abstract class HomeRepo{
  Future<Either<Failure, List<CategoryDM>>> getCategories();

  Future<Either<Failure, List<ProductDM>>> getProducts();

  Future<Either<Failure, List<ProductDM>>> getProductsByCategory(String id);
}