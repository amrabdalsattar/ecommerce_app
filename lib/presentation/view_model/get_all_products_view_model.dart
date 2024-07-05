import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/data/models/failure.dart';
import 'package:ecommerce_app/data/models/responses/products_responses/products_response.dart';
import 'package:ecommerce_app/domain/use_cases/get_all_products_use_case.dart';
import 'package:ecommerce_app/presentation/view_model/states/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllProductsViewModel extends Cubit<BaseState> {
  final GetAllProductsUseCase useCase;

  GetAllProductsViewModel(this.useCase) : super(BaseInitialState());

  void getProducts() async {
    emit(BaseLoadingState());
    Either<Failure, List<ProductDM>> response = await useCase.execute();
    response.fold((error) => emit(BaseErrorState(error.errorMessage)),
        (products) => emit(BaseSuccessState<List<ProductDM>>(data: products)));
  }
}
