import 'package:ecommerce_app/data/models/responses/products_responses/products_response.dart';
import 'package:ecommerce_app/presentation/tabs/categories_tab/categories_tab_widgets/category_products_grid_view.dart';
import 'package:ecommerce_app/presentation/view_model/categories_view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/di/di.dart';
import '../../../shared_components/loading_widget.dart';
import '../../../view_model/states/base_states.dart';

class CategoryProductsList extends StatefulWidget {
  final String categoryId;
  const CategoryProductsList({super.key, required this.categoryId});

  @override
  State<CategoryProductsList> createState() => _CategoryProductsListState();
}

class _CategoryProductsListState extends State<CategoryProductsList> {
  CategoriesViewModel categoriesViewModel = getIt<CategoriesViewModel>();

  @override
  void initState() {
    categoriesViewModel.getProductByCategory(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: categoriesViewModel,
        builder: (_,state){
      switch (state) {
        case BaseLoadingState():
          return const LoadingWidget();

        case BaseErrorState():
          return Text(state.errorMessage);

        case BaseSuccessState():
          List<ProductDM> products = state.data;
          return CategoryProductsGridView(products: products);

        default:
          return const Text("Something went wrong");
      }
    });
  }
}
