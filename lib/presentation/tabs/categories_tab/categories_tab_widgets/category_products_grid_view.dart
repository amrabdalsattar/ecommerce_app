import 'package:ecommerce_app/presentation/tabs/categories_tab/categories_tab_widgets/category_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/responses/products_responses/products_response.dart';
import '../../../view_model/cart_view_model.dart';

class CategoryProductsGridView extends StatelessWidget {
  final List<ProductDM> products;
  const CategoryProductsGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    CartViewModel cartViewModel = BlocProvider.of(context, listen: false);
    return BlocBuilder<CartViewModel, CartState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(left: 10.w, bottom: 6.h),
          child: GridView.builder(
              itemCount: products.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (_, index) {
                ProductDM product = products[index];
                return CategoryProductWidget(
                  product: products[index],
                  cartViewModel: cartViewModel,
                  isInCart: cartViewModel.isInCart(product) != null,
                  heroTag: product.id!,
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.72,
                  mainAxisSpacing: 12.h,
                  crossAxisSpacing: 12.w)),
        );
      },
    );
  }
}
