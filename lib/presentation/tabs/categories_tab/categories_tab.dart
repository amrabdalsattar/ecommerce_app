import 'package:ecommerce_app/data/models/responses/categories_responses/categories_response.dart';
import 'package:ecommerce_app/presentation/shared_components/loading_widget.dart';
import 'package:ecommerce_app/presentation/tabs/categories_tab/categories_tab_widgets/custom_tab_controller.dart';
import 'package:ecommerce_app/presentation/view_model/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/di/di.dart';
import '../../view_model/states/base_states.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  CategoriesViewModel categoriesViewModel = getIt<CategoriesViewModel>();

  @override
  void initState() {
    categoriesViewModel.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: categoriesViewModel,
        builder: (_, state) {
          switch (state) {
            case BaseLoadingState():
              return const LoadingWidget();

            case BaseErrorState():
              return Text(state.errorMessage);

            case BaseSuccessState():
              List<CategoryDM> categories = state.data;
              return CustomTabController(
                categories: categories,
              );

            default:
              return const Text("Something went wrong");
          }
        });
  }
}
