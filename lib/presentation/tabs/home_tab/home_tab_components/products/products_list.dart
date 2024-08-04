import 'package:ecommerce_app/presentation/tabs/home_tab/home_tab_components/products/product_widget.dart';
import 'package:ecommerce_app/presentation/view_model/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../data/models/responses/products_responses/products_response.dart';

class ProductsList extends StatelessWidget {
  final List<ProductDM> products;
  final bool isCategoryProducts;

  const ProductsList(
      {super.key, required this.products, this.isCategoryProducts = false});

  @override
  Widget build(BuildContext context) {
    CartViewModel cartViewModel = BlocProvider.of(context, listen: false);
    return BlocBuilder<CartViewModel, CartState>(
      builder: (context, state) {
        return isCategoryProducts
            ? Padding(
            padding: EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w, bottom: 6.h),
              child: GridView.builder(
                  itemCount: products.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, index) {
                    ProductDM product = products[index];
                    return ProductWidget(
                      product: products[index],
                      cartViewModel: cartViewModel,
                      isInCart: cartViewModel.isInCart(product) != null,
                      heroTag: product.id!,
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.775,
                      mainAxisSpacing: 12.h,
                      crossAxisSpacing: 12.w)),
            )
            : ListView.builder(
                itemCount: products.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: isCategoryProducts? Axis.vertical : Axis.horizontal,
                itemBuilder: (_, index) {
                  ProductDM product = products[index];
                  return ProductWidget(
                    product: products[index],
                    isInCart: cartViewModel.isInCart(product) != null,
                    cartViewModel: cartViewModel,
                    heroTag: product.id!,
                  );
                });
      },
    );
  }
}
