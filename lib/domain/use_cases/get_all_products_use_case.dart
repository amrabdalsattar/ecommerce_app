import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/data/models/responses/products_responses/products_response.dart';
import 'package:ecommerce_app/domain/repos/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsUseCase {
  final HomeRepo repo;

  const GetAllProductsUseCase(this.repo);

  Future<Either<Failure, List<ProductDM>>> execute() {
    return repo.getProducts();
  }
}
