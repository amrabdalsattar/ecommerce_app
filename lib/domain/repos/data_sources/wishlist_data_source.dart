import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/data/models/responses/wishlist_responses/wishlist_response.dart';

abstract class WishlistDataSource {
  const WishlistDataSource();

  Future<Either<Failure, List<WishlistItem>>> getWishlistItems();

  Future<Either<Failure, String?>> addToWishlist(String id);

  Future<Either<Failure, String?>> removeFromWishlist(String id);
}
