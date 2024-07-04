import 'package:ecommerce_app/domain/di/di.dart';
import 'package:ecommerce_app/presentation/shared_components/home_title.dart';
import 'package:ecommerce_app/presentation/shared_components/loading_widget.dart';
import 'package:ecommerce_app/presentation/tabs/home_tab/home_tab_components/products/products_list.dart';
import 'package:ecommerce_app/presentation/view_model/get_all_categories_view_model.dart';
import 'package:ecommerce_app/presentation/view_model/get_all_products_view_model.dart';
import 'package:ecommerce_app/presentation/view_model/states/base_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_tab_components/categories/categories_grid_view.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  GetAllCategoriesViewModel categoriesViewModel = getIt();
  GetAllProductsViewModel productsViewModel = getIt();

  @override
  void initState() {
    super.initState();
    categoriesViewModel.getCategories();
    productsViewModel.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HomeTitle(title: "Categories"),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "View all",
                      style: Theme.of(context).textTheme.bodySmall,
                    ))
              ],
            ),
            SizedBox(height: 15.h,),
            SizedBox(
              height: 280.h,
              child: BlocBuilder(
                bloc: categoriesViewModel,
                builder: (_, state) {
                  switch (state) {
                    case BaseLoadingState():
                      return const LoadingWidget();

                    case BaseErrorState():
                      return Text(state.errorMessage);

                    case BaseSuccessState():
                      return CategoriesGridView(categories: state.data);

                    default:
                      return const Text("Something went Wrong");
                  }
                },
              ),
            ),
            const HomeTitle(title: "Products"),
            SizedBox(height: 15.h,),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.30,
              child: BlocBuilder(
                bloc: productsViewModel,
                builder: (_, state) {
                  switch (state) {
                    case BaseLoadingState():
                      return const LoadingWidget();

                    case BaseErrorState():
                      return Text(state.errorMessage);

                    case BaseSuccessState():
                      return ProductsList(products: state.data);

                    default:
                      return const Text("Something went Wrong");
                  }
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
