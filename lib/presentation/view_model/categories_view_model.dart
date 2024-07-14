import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/use_cases/get_all_categories_use_case.dart';
import 'package:ecommerce_app/presentation/view_model/states/base_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/failure.dart';
import '../../data/models/responses/categories_responses/categories_response.dart';

@injectable
class CategoriesViewModel extends Cubit<BaseState> {
  CategoriesViewModel(this.useCase) : super(BaseInitialState());
  final GetAllCategoriesUseCase useCase;

  void getCategories() async {
    emit(BaseLoadingState());
    Either<Failure, List<CategoryDM>> response = await useCase.execute();
    response.fold(
        (error) => emit(BaseErrorState(error.errorMessage)),
        (categories) =>
            emit(BaseSuccessState<List<CategoryDM>>(data: categories)));
  }
}
