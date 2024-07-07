import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/domain/use_cases/cart_use_cases/get_logged_user_cart_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/cart_use_cases/remove_from_cart_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/responses/products_responses/cart_response.dart';
import '../../domain/use_cases/cart_use_cases/add_to_cart_use_case.dart';

@injectable
class CartViewModel extends Cubit<CartState> {
  final AddToCartUseCase addToCartUseCase;
  final GetLoggedUserCartUseCase getLoggedUserCartUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;
  bool isLoadingToCart = false;
  CartDM? cartDM;

  CartViewModel(this.addToCartUseCase, this.getLoggedUserCartUseCase,
      this.removeFromCartUseCase)
      : super(CartInitial());

  Future<void> addToCart(String id) async {
    isLoadingToCart = true;
    emit(CartLoading());
    Either<Failure, CartDM> response = await addToCartUseCase.execute(id);
    response.fold((error) => emit(CartError(error.errorMessage)), (cart) {
      cartDM = cart;
      emit(CartSuccess(data: cart));
    });
    isLoadingToCart = false;
  }

  Future<void> removeFromCart(String id) async {
    isLoadingToCart = true;
    emit(CartLoading());
    Either<Failure, CartDM> response = await removeFromCartUseCase.execute(id);
    response.fold((error) {
      emit(CartError(error.errorMessage));
    }, (cart) {
      cartDM = cart;
      emit(CartSuccess(data: cartDM));
    });
    isLoadingToCart = false;
  }

  void getCartList() async {
    emit(CartLoading());
    Either<Failure, CartDM> response = await getLoggedUserCartUseCase.execute();
    response.fold((error) => emit(CartError(error.errorMessage)), (cart) {
      cartDM = cart;
      emit(CartSuccess(data: cartDM));
    });
  }

  Future<void> loading() async{
    emit(CartLoading());
  }
  Future<void> hideLoading() async{
    emit(CartSuccess());
  }
}

abstract class CartState {}

class CartInitial extends CartState {}

class CartSuccess<T> extends CartState {
  T? data;

  CartSuccess({this.data});
}

class CartLoading extends CartState {}

class CartError extends CartState {
  String? errorMessage;

  CartError(this.errorMessage);
}
