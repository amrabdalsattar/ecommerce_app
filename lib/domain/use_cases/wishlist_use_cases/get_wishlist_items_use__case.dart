import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../../data/models/responses/products_responses/products_response.dart';
import '../../repos/wishlist_repo.dart';

@injectable
class GetWishlistItemsUseCase {
  final WishlistRepo repo;

  const GetWishlistItemsUseCase(this.repo);

  Future<Either<Failure, List<ProductDM>>> execute() {
    return repo.getWishlistItems();
  }
}
