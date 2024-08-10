import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/domain/repos/data_sources/wishlist_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../domain/repos/wishlist_repo.dart';
import '../models/responses/products_responses/products_response.dart';

@Injectable(as: WishlistRepo)
class WishlistRepoImpl extends WishlistRepo {
  final WishlistDataSource dataSource;
  final InternetConnectionChecker connectionChecker;

  const WishlistRepoImpl(this.dataSource, this.connectionChecker);

  @override
  Future<Either<Failure, String?>> addToWishlist(String id) async {
    bool isConnectedToInternet = await connectionChecker.hasConnection;
    if (isConnectedToInternet) {
      return dataSource.addToWishlist(id);
    } else {
      return Left(Failure("Check your Internet Connection !"));
    }
  }

  @override
  Future<Either<Failure, List<ProductDM>>> getWishlistItems() async {
    bool isConnectedToInternet = await connectionChecker.hasConnection;
    if (isConnectedToInternet) {
      return dataSource.getWishlistItems();
    } else {
      return Left(Failure("Check your Internet Connection !"));
    }
  }

  @override
  Future<Either<Failure, String?>> removeFromWishlist(String id) async {
    bool isConnectedToInternet = await connectionChecker.hasConnection;
    if (isConnectedToInternet) {
      return dataSource.removeFromWishlist(id);
    } else {
      return Left(Failure("Check your Internet Connection !"));
    }
  }
}
