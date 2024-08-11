import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/data/models/responses/wishlist_responses/wishlist_functionality_response.dart';
import 'package:ecommerce_app/data/models/responses/wishlist_responses/wishlist_response.dart';
import 'package:ecommerce_app/domain/repos/data_sources/wishlist_data_source.dart';
import 'package:ecommerce_app/utils/networking/api_constants.dart';
import 'package:ecommerce_app/utils/networking/api_factory.dart';
import 'package:injectable/injectable.dart';

import '../../models/responses/products_responses/products_response.dart';

@Injectable(as: WishlistDataSource)
class WishlistDataSourceImpl extends WishlistDataSource {
  final ApiFactory api;

  const WishlistDataSourceImpl(this.api);

  @override
  Future<Either<Failure, String?>> addToWishlist(String id) async {
    try {
      final response = await api
          .post(ApiConstants.wishlistEndPoint, data: {"productId": id});
      WishlistFunctionalityResponse wishlistFunctionalityResponse =
          WishlistFunctionalityResponse.fromJson(response);

      return Right(wishlistFunctionalityResponse.message);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductDM>>> getWishlistItems() async {
    try {
      final response = await api.get(ApiConstants.wishlistEndPoint);
      WishlistResponse wishlistResponse = WishlistResponse.fromJson(response);
      return Right(wishlistResponse.data!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> removeFromWishlist(String id) async {
    try {
      final response = await api.delete("${ApiConstants.wishlistEndPoint}/$id");
      WishlistFunctionalityResponse wishlistFunctionalityResponse =
          WishlistFunctionalityResponse.fromJson(response);
      return Right(wishlistFunctionalityResponse.message);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
