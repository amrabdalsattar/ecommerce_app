import 'package:ecommerce_app/presentation/shared_components/product_widgets/product_widget.dart';
import 'package:ecommerce_app/presentation/view_model/wishlist_view_model.dart';
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
    WishlistViewModel wishlistViewModel =
        BlocProvider.of(context, listen: false);
    CartViewModel cartViewModel = BlocProvider.of(context, listen: false);
    return BlocBuilder<WishlistViewModel, WishlistState>(
      bloc: wishlistViewModel,
      builder: (_, state) => BlocBuilder<CartViewModel, CartState>(
        bloc: cartViewModel,
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(left: 10.w, bottom: 6.h),
            child: GridView.builder(
                itemCount: products.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (_, index) {
                  ProductDM product = products[index];
                  return ProductWidget(
                    product: product,
                    cartViewModel: cartViewModel,
                    isInCart: cartViewModel.isInCart(product) != null,
                    heroTag: product.id!,
                    isInWishlist: wishlistViewModel.isInWishlist(product),
                    wishlistViewModel: context.read<WishlistViewModel>(),
                  ).categoryProductItem();
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.72,
                    mainAxisSpacing: 12.h,
                    crossAxisSpacing: 12.w)),
          );
        },
      ),
    );
  }
}
