import 'package:ecommerce_app/presentation/view_model/cart_view_model.dart';
import 'package:ecommerce_app/presentation/view_model/states/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsViewModel extends Cubit<BaseState> {
  ProductDetailsViewModel() : super(BaseInitialState());

  void increaseNumberOfItems(CartViewModel cartViewModel, String id) async {
    emit(BaseLoadingState());
    await cartViewModel.addToCart(id);
    emit(BaseSuccessState());
  }

  void decreaseNumberOfItems(CartViewModel cartViewModel, String id) async {
    emit(BaseLoadingState());
    await cartViewModel.removeFromCart(id);
    emit(BaseSuccessState());
  }

  int currentSliderIndex = 0;

  void changeSliderIndex(int index) {
    currentSliderIndex = index;
    emit(BaseSuccessState());
  }
}
