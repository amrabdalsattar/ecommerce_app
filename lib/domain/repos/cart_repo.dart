import 'package:dartz/dartz.dart';

import '../../data/models/failure.dart';
import '../../data/models/responses/products_responses/cart_response.dart';

abstract class CartRepo{
  Future<Either<Failure, CartDM>> getLoggedUserCart();

  Future<Either<Failure, CartDM>> addItemToCart(String id);

  Future<Either<Failure, CartDM>> removeItemFromCart(String id);
}