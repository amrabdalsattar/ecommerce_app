import 'package:ecommerce_app/presentation/view_model/cart_view_model.dart';
import 'package:ecommerce_app/presentation/view_model/states/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsViewModel extends Cubit{
  ProductDetailsViewModel() : super(BaseInitialState());


  void increaseNumberOfItems(CartViewModel cartViewModel, String id) async {
    await cartViewModel.addToCart(id);
    emit(id);
  }
  void decreaseNumberOfItems(CartViewModel cartViewModel, String id) async {
      await cartViewModel.removeFromCart(id);
      emit(id);
  }

  int currentSliderIndex = 0;

  void changeSliderIndex(int index){
    currentSliderIndex = index;
    emit(index);
  }
}