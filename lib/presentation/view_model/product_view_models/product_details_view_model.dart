import 'package:ecommerce_app/presentation/view_model/states/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductDetailsViewModel extends Cubit{
  ProductDetailsViewModel() : super(BaseInitialState());

  int numberOfItems = 1;

  void increaseNumberOfItems(){
    numberOfItems++;
    emit(numberOfItems);
  }
  void decreaseNumberOfItems(){
    if(numberOfItems > 1){
      numberOfItems--;
      emit(numberOfItems);
    }else{
      return;
    }
  }

  int currentSliderIndex = 0;

  void changeSliderIndex(int index){
    currentSliderIndex = index;
    emit(index);
  }
}