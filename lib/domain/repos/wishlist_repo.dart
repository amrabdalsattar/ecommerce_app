import 'package:dartz/dartz.dart';

import '../../data/models/failure.dart';
import '../../data/models/responses/products_responses/products_response.dart';

abstract class WishlistRepo {
  const WishlistRepo();
  Future<Either<Failure, List<ProductDM>>> getWishlistItems();

  Future<Either<Failure, String?>> addToWishlist(String id);

  Future<Either<Failure, String?>> removeFromWishlist(String id);
}
