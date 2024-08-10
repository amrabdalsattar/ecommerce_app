import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/failure.dart';
import '../../repos/wishlist_repo.dart';

@injectable
class RemoveFromWishlistUseCase {
  final WishlistRepo repo;
  const RemoveFromWishlistUseCase(this.repo);
  Future<Either<Failure, String?>> execute(String id){
    return repo.removeFromWishlist(id);
  }
}
