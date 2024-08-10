import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/data/models/responses/wishlist_responses/wishlist_response.dart';
import 'package:ecommerce_app/domain/use_cases/wishlist_use_cases/add_to_wishlist_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/wishlist_use_cases/get_wishlist_items_use__case.dart';
import 'package:ecommerce_app/domain/use_cases/wishlist_use_cases/remove_from_wishlist_use_case.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/dialog_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/responses/products_responses/products_response.dart';

@injectable
class WishlistViewModel extends Cubit<WishlistState> {
  WishlistViewModel(this.addToWishlistUseCase, this.getWishlistItemsUseCase,
      this.removeFromWishlistUseCase)
      : super(WishlistInitial());

  final AddToWishlistUseCase addToWishlistUseCase;
  final GetWishlistItemsUseCase getWishlistItemsUseCase;
  final RemoveFromWishlistUseCase removeFromWishlistUseCase;
  WishlistResponse? wishlistResponse;
  List<ProductDM> wishlistItems = [];

  void getWishlistItems() async {
    emit(WishlistLoading());
    Either<Failure, List<ProductDM>> response =
        await getWishlistItemsUseCase.execute();
    response.fold((error) => emit(WishlistError(error.errorMessage)), (items) {
      wishlistItems = items;
      emit(WishlistSuccess(data: items));
    });
  }

  void addToWishlist(ProductDM product) async {
    wishlistItems.add(product);
    emit(WishlistLoading());
    Either<Failure, String?> response =
        await addToWishlistUseCase.execute(product.id!);
    response.fold((error) {
      showToast(
          message: error.errorMessage,
          color: AppColors.red,
          textColor: AppColors.white);
      emit(WishlistError(error.errorMessage));
    }, (successMessage) {
      showToast(
          message: successMessage!,
          color: AppColors.fadedWhite,
          textColor: AppColors.primary);
      emit(WishlistSuccess(data: successMessage));
    });
  }

  void removeFromWishlist(ProductDM product) async {
    wishlistItems.remove(product);
    emit(WishlistLoading());
    Either<Failure, String?> response =
        await removeFromWishlistUseCase.execute(product.id!);
    response.fold((error) {
      showToast(
          message: error.errorMessage,
          color: AppColors.red,
          textColor: AppColors.white);
      emit(WishlistError(error.errorMessage));
    }, (successMessage) {
      getWishlistItems();
      showToast(
          message: successMessage!,
          color: AppColors.fadedWhite,
          textColor: AppColors.primary);
      emit(WishlistSuccess(data: successMessage));
    });
  }

  bool isInWishlist(ProductDM product) {
    for (int i = 0; i < wishlistItems.length; i++) {
      if (product.id == wishlistItems[i].id) {
        return true;
      }
    }
    return false;
  }
}

sealed class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistSuccess<T> extends WishlistState {
  T? data;

  WishlistSuccess({this.data});
}

class WishlistLoading extends WishlistState {}

class WishlistError extends WishlistState {
  String? errorMessage;

  WishlistError(this.errorMessage);
}
