import 'package:ecommerce_app/data/models/responses/home_responses/categories_response.dart';
import 'package:ecommerce_app/presentation/screens/main_screen/tabs/home_tab/home_tab_components/categories/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesGridView extends StatelessWidget {
  final List<CategoryDM> categories;
  const CategoriesGridView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      physics: const BouncingScrollPhysics(),

      scrollDirection: Axis.horizontal,
      itemBuilder: (_, int index) => CategoryWidget(categoryDM: categories[index]),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
          mainAxisSpacing: 16.w),
    );
  }
}
