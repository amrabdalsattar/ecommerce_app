import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/domain/repos/wishlist_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToWishlistUseCase {
  final WishlistRepo repo;
  const AddToWishlistUseCase(this.repo);
  Future<Either<Failure, String?>> execute(String id){
    return repo.addToWishlist(id);
  }
}
