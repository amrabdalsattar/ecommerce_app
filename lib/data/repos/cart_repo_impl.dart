import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/data/models/responses/products_responses/cart_response.dart';
import 'package:ecommerce_app/domain/repos/cart_repo.dart';
import 'package:ecommerce_app/domain/repos/data_sources/cart_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@Injectable(as: CartRepo)
class CartRepoImpl extends CartRepo {
  final CartDataSource ds;

  CartRepoImpl(this.ds);

  @override
  Future<Either<Failure, CartDM>> addItemToCart(String id) async {
    bool isConnectedToInternet =
        await InternetConnectionChecker().hasConnection;
    if (isConnectedToInternet) {
      return ds.addItemToCart(id);
    } else {
      return Left(Failure("Check your Internet Connection !"));
    }
  }

  @override
  Future<Either<Failure, CartDM>> getLoggedUserCart() async {
    bool isConnectedToInternet =
        await InternetConnectionChecker().hasConnection;
    if (isConnectedToInternet) {
      return ds.getLoggedUserCart();
    } else {
      return Left(Failure("Check your Internet Connection !"));
    }
  }

  @override
  Future<Either<Failure, CartDM>> removeItemFromCart(String id) async {
    bool isConnectedToInternet =
        await InternetConnectionChecker().hasConnection;
    if (isConnectedToInternet) {
      return ds.removeItemFromCart(id);
    } else {
      return Left(Failure("Check your Internet Connection !"));
    }
  }
}
