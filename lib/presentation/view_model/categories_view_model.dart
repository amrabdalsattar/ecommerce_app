import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/use_cases/get_all_categories_use_case.dart';
import 'package:ecommerce_app/domain/use_cases/get_products_by_category_use_case.dart';
import 'package:ecommerce_app/presentation/view_model/states/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/failure.dart';
import '../../data/models/responses/categories_responses/categories_response.dart';
import '../../data/models/responses/products_responses/products_response.dart';

@injectable
class CategoriesViewModel extends Cubit {
  CategoriesViewModel(
      this.getAllCategoriesUseCase, this.getProductsByCategoryUseCase)
      : super(BaseInitialState());
  final GetAllCategoriesUseCase getAllCategoriesUseCase;
  final GetProductsByCategoryUseCase getProductsByCategoryUseCase;

  void getCategories() async {
    emit(BaseLoadingState());
    Either<Failure, List<CategoryDM>> response =
        await getAllCategoriesUseCase.execute();
    response.fold(
        (error) => emit(BaseErrorState(error.errorMessage)),
        (categories) =>
            emit(BaseSuccessState<List<CategoryDM>>(data: categories)));
  }

  void getProductByCategory(String id) async {
    emit(BaseLoadingState());
    Either<Failure, List<ProductDM>> response =
        await getProductsByCategoryUseCase.execute(id);
    response.fold(
        (error) => emit(BaseErrorState(error.errorMessage)),
        (products) => products.isEmpty
            ? emit(BaseErrorState(
                "Sorry, There is no items under this category right now."))
            : emit(BaseSuccessState(data: products)));
  }
}
