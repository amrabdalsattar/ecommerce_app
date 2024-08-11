import 'package:ecommerce_app/domain/di/di.dart';
import 'package:ecommerce_app/presentation/tabs/home_tab/home_tab_components/products/products_list.dart';
import 'package:ecommerce_app/presentation/view_model/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared_components/app_bars/inner_screens_app_bar.dart';
import '../../../../shared_components/loading_widget.dart';
import '../../../../view_model/states/base_states.dart';

class CategoryProductsScreen extends StatefulWidget {
  final String categoryName;
  final String categoryId;

  const CategoryProductsScreen(
      {super.key, required this.categoryName, required this.categoryId});

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  CategoriesViewModel categoriesViewModel = getIt<CategoriesViewModel>();

  @override
  void initState() {
    categoriesViewModel.getProductByCategory(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: InnerScreensAppBar(
          title: widget.categoryName,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: BlocBuilder(
          bloc: categoriesViewModel,
          builder: (_, state) {
            switch (state) {
              case BaseLoadingState():
                return const LoadingWidget();

              case BaseErrorState():
                return Center(
                    child: Text(
                  state.errorMessage,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ));

              case BaseSuccessState():
                return ProductsList(
                  products: state.data,
                  isCategoryProducts: true,
                );

              default:
                return const Text("Something went Wrong");
            }
          },
        ),
      ),
    );
  }
}
