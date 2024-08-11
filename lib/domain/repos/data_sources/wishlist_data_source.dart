import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';

import '../../../data/models/responses/products_responses/products_response.dart';

abstract class WishlistDataSource {
  const WishlistDataSource();

  Future<Either<Failure, List<ProductDM>>> getWishlistItems();

  Future<Either<Failure, String?>> addToWishlist(String id);

  Future<Either<Failure, String?>> removeFromWishlist(String id);
}
