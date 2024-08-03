import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/repos/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/failure.dart';
import '../../data/models/responses/products_responses/products_response.dart';

@injectable
class GetProductsByCategoryUseCase {
  final HomeRepo repo;

  const GetProductsByCategoryUseCase(this.repo);

  Future<Either<Failure, List<ProductDM>>> execute(String id) {
    return repo.getProductsByCategory(id);
  }
}
