import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';

abstract class HomeRepo{
  Future<Either<Failure, bool>> getCategories();

  Future<Either<Failure, bool>> getProducts();
}