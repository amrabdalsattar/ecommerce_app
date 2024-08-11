import 'package:ecommerce_app/domain/di/di.dart';
import 'package:ecommerce_app/presentation/shared_components/home_title.dart';
import 'package:ecommerce_app/presentation/shared_components/shimmers/category_shimmer_loading.dart';
import 'package:ecommerce_app/presentation/shared_components/shimmers/product_shimmer_loading.dart';
import 'package:ecommerce_app/presentation/shared_components/slider_widget.dart';
import 'package:ecommerce_app/presentation/tabs/home_tab/home_tab_components/products/products_list.dart';
import 'package:ecommerce_app/presentation/view_model/categories_view_model.dart';
import 'package:ecommerce_app/presentation/view_model/product_view_models/product_details_view_model.dart';
import 'package:ecommerce_app/presentation/view_model/product_view_models/products_view_model.dart';
import 'package:ecommerce_app/presentation/view_model/states/base_states.dart';
import 'package:ecommerce_app/utils/app_assets.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
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
  CategoriesViewModel categoriesViewModel = getIt();
  ProductsViewModel productsViewModel = getIt();
  ProductDetailsViewModel productDetailsViewModel =
      getIt<ProductDetailsViewModel>();

  @override
  void initState() {
    super.initState();
    if (categoriesViewModel.categoriesList.isEmpty) {
      categoriesViewModel.getCategories();
    }
    if (productsViewModel.productsList.isEmpty) {
      productsViewModel.getProducts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ProductDetailsViewModel, dynamic>(
                bloc: productDetailsViewModel,
                builder: (context, state) => Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: SliderWidget(
                        images: AppAssets.slides,
                        viewModel: productDetailsViewModel,
                        isLocalImages: true,
                      ),
                    )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HomeTitle(title: "Categories"),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "View all",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.secondary),
                    ))
              ],
            ),
            SizedBox(
              height: 230.h,
              child: BlocBuilder(
                bloc: categoriesViewModel,
                builder: (_, state) {
                  switch (state) {
                    case BaseLoadingState():
                      return const CategoryShimmerLoading();

                    case BaseErrorState():
                      return Text(state.errorMessage);

                    case BaseSuccessState():
                      return CategoriesGridView(
                        categories: categoriesViewModel.categoriesList,
                      );

                    default:
                      return const Text("Something went Wrong");
                  }
                },
              ),
            ),
            const HomeTitle(title: "Most Selling"),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.28,
              margin: EdgeInsets.only(bottom: 16.h),
              child: BlocBuilder(
                bloc: productsViewModel,
                builder: (_, state) {
                  switch (state) {
                    case BaseLoadingState():
                      return const ProductShimmerLoading();

                    case BaseErrorState():
                      return Text(state.errorMessage);

                    case BaseSuccessState():
                      return ProductsList(products: productsViewModel.productsList);

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
