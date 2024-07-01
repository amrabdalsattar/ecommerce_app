import 'package:ecommerce_app/domain/di/di.dart';
import 'package:ecommerce_app/presentation/screens/main_screen/tabs/home_tab/home_tab_components/categories/categories_grid_view.dart';
import 'package:ecommerce_app/presentation/view_model/get_all_categories_view_model.dart';
import 'package:ecommerce_app/presentation/view_model/get_all_products_view_model.dart';
import 'package:ecommerce_app/presentation/view_model/states/base_states.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  GetAllProductsViewModel productsViewModel = getIt();
  GetAllCategoriesViewModel categoriesViewModel = getIt();

  @override
  void initState() {
    super.initState();
    categoriesViewModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: AppColors.primary),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "View all",
                      style: Theme.of(context).textTheme.bodySmall,
                    ))
              ],
            ),
            SizedBox(
              height: 300.h,
              child: BlocBuilder(
                bloc: categoriesViewModel,
                builder: (_, state) {
                  switch (state) {
                    case BaseLoadingState():
                      return const Center(
                        child: CircularProgressIndicator(),
                      );

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
          ],
        ),
      ),
    );
  }
}
