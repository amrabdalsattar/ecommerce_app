import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/domain/use_cases/cart_use_cases/get_logged_user_cart_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/cart_use_cases/remove_from_cart_use_case.dart';
import 'package:ecommerce_app/presentation/view_model/states/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/responses/products_responses/cart_response.dart';
import '../../domain/use_cases/cart_use_cases/add_to_cart_use_case.dart';

@injectable
class CartViewModel extends Cubit<BaseState> {
  final AddToCartUseCase addToCartUseCase;
  final GetLoggedUserCartUseCase getLoggedUserCartUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;
  CartDM? cartDM;

  CartViewModel(this.addToCartUseCase, this.getLoggedUserCartUseCase,
      this.removeFromCartUseCase)
      : super(BaseInitialState());

  void addToCart(String id) async {
    emit(BaseLoadingState());
    Either<Failure, CartDM> response = await addToCartUseCase.execute(id);
    response.fold((error) => emit(BaseErrorState(error.errorMessage)),
        (cart) {
      cartDM = cart;
          emit(BaseSuccessState(data: cart));
        });
  }

  void removeFromCart(String id) async {
    emit(BaseLoadingState());
    Either<Failure, CartDM> response = await removeFromCartUseCase.execute(id);
    response.fold((error) => emit(BaseErrorState(error.errorMessage)),
            (cart) {
          cartDM = cart;
          emit(BaseSuccessState(data: cart));
        });
  }

  void getCartList() async {
    emit(BaseLoadingState());
    Either<Failure, CartDM> response = await getLoggedUserCartUseCase.execute();
    response.fold((error) => emit(BaseErrorState(error.errorMessage)),
            (cart) {
          cartDM = cart;
          emit(BaseSuccessState(data: cart));
        });
  }
}
