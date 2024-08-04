import 'package:ecommerce_app/data/models/responses/categories_responses/categories_response.dart';
import 'package:ecommerce_app/presentation/tabs/categories_tab/categories_tab_widgets/category_products_list.dart';
import 'package:ecommerce_app/presentation/tabs/categories_tab/categories_tab_widgets/category_tab_widget.dart';
import 'package:ecommerce_app/presentation/view_model/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/di/di.dart';
import '../../../../utils/app_colors.dart';

class CustomTabController extends StatefulWidget {
  final List<CategoryDM> categories;

  const CustomTabController({super.key, required this.categories});

  @override
  State<CustomTabController> createState() => _CustomTabControllerState();
}

class _CustomTabControllerState extends State<CustomTabController> {
  CategoriesViewModel categoriesViewModel = getIt<CategoriesViewModel>();
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w, top: 10.h),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10)),
        child: DefaultTabController(
            length: widget.categories.length,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Container(
                      color: AppColors.liteGrey,
                      child: TabBar(
                        onTap: (index) {
                          currentTabIndex = index;
                          setState(() {});
                        },

                        labelColor: AppColors.primary,
                        unselectedLabelColor: AppColors.primary,
                        labelStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.bold, fontSize: 11.sp),
                        indicatorWeight: 5,
                        splashBorderRadius: BorderRadius.circular(20),
                        physics: const BouncingScrollPhysics(),
                        automaticIndicatorColorAdjustment: true,
                        tabAlignment: TabAlignment.start,
                        overlayColor: const WidgetStatePropertyAll(AppColors.white),
                        indicatorColor: AppColors.primary,
                        isScrollable: true,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 2),
                        tabs: widget.categories
                            .map((category) => CategoryTabWidget(
                                  title: category.name!,
                                  isSelected: currentTabIndex ==
                                      widget.categories.indexOf(category),
                                )
                        )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                      children: widget.categories
                          .map((category) => CategoryProductsList(categoryId: category.id!))
                          .toList()),
                )
              ],
            )),
      ),
    );
  }
}
