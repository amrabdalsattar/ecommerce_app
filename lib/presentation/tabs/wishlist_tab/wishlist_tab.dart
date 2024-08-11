import 'package:ecommerce_app/presentation/screens/main_screen/main_screen_components/cart/cart_components/empty_cart_image.dart';
import 'package:ecommerce_app/presentation/shared_components/product_widgets/product_widget.dart';
import 'package:ecommerce_app/presentation/view_model/cart_view_model.dart';
import 'package:ecommerce_app/presentation/view_model/wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistTab extends StatelessWidget {
  const WishlistTab({super.key});

  @override
  Widget build(BuildContext context) {
    WishlistViewModel wishlistViewModel = BlocProvider.of(context);
    return BlocBuilder<WishlistViewModel, WishlistState>(
      bloc: wishlistViewModel,
      builder:(_, state) => wishlistViewModel.wishlistItems.isEmpty ? const EmptyCartImage(screenTitle: "wishlist",)
          : ListView.builder(
        padding: EdgeInsets.only(top: 5.h),
              itemCount: wishlistViewModel.wishlistItems.length,
              itemBuilder: (_, index) => ProductWidget(
                      product: wishlistViewModel.wishlistItems[index],
                      isInCart: false,
                      cartViewModel: context.read<CartViewModel>(),
                      heroTag: wishlistViewModel.wishlistItems[index].id!,
                      isInWishlist: true,
                      wishlistViewModel: wishlistViewModel)
                  .wishlistProductItem()),
    );
  }
}
