import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/data/models/responses/products_responses/cart_response.dart';
import 'package:ecommerce_app/domain/repos/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveFromCartUseCase {
  final CartRepo repo;
  RemoveFromCartUseCase(this.repo);

  Future<Either<Failure, CartDM>> execute(String id){
    return repo.removeItemFromCart(id);
  }
}
