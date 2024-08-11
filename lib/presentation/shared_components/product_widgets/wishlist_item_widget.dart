import 'package:ecommerce_app/data/models/responses/products_responses/products_response.dart';
import 'package:ecommerce_app/presentation/shared_components/buttons/methods_button.dart';
import 'package:ecommerce_app/presentation/shared_components/custom_network_image.dart';
import 'package:ecommerce_app/presentation/view_model/cart_view_model.dart';
import 'package:ecommerce_app/presentation/view_model/wishlist_view_model.dart';
import 'package:ecommerce_app/utils/app_assets.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/ui_logic_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistItemWidget extends StatelessWidget {
  final ProductDM product;
  final CartViewModel cartViewModel;
  final WishlistViewModel wishlistViewModel;

  const WishlistItemWidget(
      {super.key,
      required this.product,
      required this.cartViewModel,
      required this.wishlistViewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
      height: 90.h,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.liteBlue),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CustomNetworkImage(
                    imageUrl: product.imageCover!,
                  ))),
          Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      product.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      product.category!.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.litePrimary),
                    ),
                    Text(
                      "EGP ${numbersFormat(product.price!)}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        wishlistViewModel.removeFromWishlist(product);
                      },
                      borderRadius: BorderRadius.circular(20),
                      overlayColor: const WidgetStatePropertyAll(AppColors.liteGrey),
                      child: Image.asset(AppAssets.inWishlistIcon)),
                  Container(
                    margin: const EdgeInsets.all(6),
                    height: 30.h,
                    width: 100.w,
                    child: BlocBuilder<CartViewModel, CartState>(
                      bloc: cartViewModel,
                      builder: (_, state) => MethodsButton(
                          onPressed: () {
                            cartViewModel.addToCart(product.id!);
                            wishlistViewModel.removeFromWishlist(product,
                                isTransferredFromWishlistToCart: true);
                          },
                          body: Text(
                            "Add to Cart",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: AppColors.white,
                                    fontSize: 10.5.sp,
                                    fontWeight: FontWeight.bold),
                          )),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
