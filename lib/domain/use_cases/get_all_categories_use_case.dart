import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/data/models/responses/categories_responses/categories_response.dart';
import 'package:ecommerce_app/domain/repos/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCategoriesUseCase {
  final HomeRepo repo;

  const GetAllCategoriesUseCase(this.repo);

  Future<Either<Failure, List<CategoryDM>>> execute() {
    return repo.getCategories();
  }
}
