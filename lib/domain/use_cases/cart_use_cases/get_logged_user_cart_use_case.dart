import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../../data/models/responses/products_responses/cart_response.dart';
import '../../repos/cart_repo.dart';

@injectable
class GetLoggedUserCartUseCase{
  final CartRepo repo;
  GetLoggedUserCartUseCase(this.repo);

  Future<Either<Failure, CartDM>> execute(){
    return repo.getLoggedUserCart();
  }
}