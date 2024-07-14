import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/data/models/responses/products_responses/cart_response.dart';

abstract class CartDataSource{

  Future<Either<Failure, CartDM>> getLoggedUserCart();

  Future<Either<Failure, CartDM>> addItemToCart(String id);

  Future<Either<Failure, CartDM>> removeItemFromCart(String id);
}