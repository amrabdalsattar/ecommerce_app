import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/data/models/responses/products_responses/cart_response.dart';
import 'package:ecommerce_app/utils/networking/api_constants.dart';
import 'package:ecommerce_app/utils/networking/api_factory.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repos/data_sources/cart_data_source.dart';

@Injectable(as: CartDataSource)
class CartDataSourceImpl extends CartDataSource {
  final ApiFactory api;

  CartDataSourceImpl(this.api);

  @override
  Future<Either<Failure, CartDM>> getLoggedUserCart() async {
    final response = await api.get(ApiConstants.getLoggedUserCartEndPoint);
    CartResponse cartResponse = CartResponse.fromJson(response);
    return Right(cartResponse.cartData!);
  }

  @override
  Future<Either<Failure, CartDM>> addItemToCart(String id) async {
    final response = await api
        .post(ApiConstants.getLoggedUserCartEndPoint, data: {"productId": id});
    return getLoggedUserCart();
  }

  @override
  Future<Either<Failure, CartDM>> removeItemFromCart(String id) async {
    final response =
        await api.delete("${ApiConstants.getLoggedUserCartEndPoint}/$id");
    CartResponse cartResponse = CartResponse.fromJson(response);

    return getLoggedUserCart();
  }
}
