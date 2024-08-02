import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/use_cases/get_products_by_category_use_case.dart';
import 'package:ecommerce_app/presentation/view_model/states/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/failure.dart';
import '../../../data/models/responses/products_responses/products_response.dart';

class CategoryProductsViewModel extends Cubit {
  CategoryProductsViewModel(this.useCase) : super(BaseInitialState());
  final GetProductsByCategoryUseCase useCase;

  void getProductByCategory(String id) async {
    emit(BaseLoadingState());
    Either<Failure, List<ProductDM>> response = await useCase.execute(id);
    response.fold((error) => emit(BaseErrorState(error.errorMessage)),
        (products) => emit(BaseSuccessState(data: products)));
  }
}
