import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/presentation/view_model/wishlist_view_model.dart';
import 'package:ecommerce_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/responses/products_responses/products_response.dart';
import '../../../domain/di/di.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/dialog_utils.dart';
import '../../../utils/ui_logic_functions.dart';
import '../../tabs/home_tab/home_tab_components/products/product_details.dart';
import '../../view_model/cart_view_model.dart';
import '../../view_model/product_view_models/products_view_model.dart';
import '../../view_model/states/base_states.dart';
import '../loading_widget.dart';

class CategoryProductWidget extends StatefulWidget {
  final ProductDM product;
  final bool isInCart;
  final bool isInWishlist;
  final CartViewModel cartViewModel;
  final WishlistViewModel wishlistViewModel;
  final String heroTag;

  const CategoryProductWidget(
      {super.key,
      required this.product,
      required this.isInCart,
      required this.cartViewModel,
      required this.heroTag,
      required this.wishlistViewModel,
      required this.isInWishlist});

  @override
  State<CategoryProductWidget> createState() => _CategoryProductWidgetState();
}

class _CategoryProductWidgetState extends State<CategoryProductWidget> {
  bool isLoadingToWishlist = false;
  bool isLoadingToCart = false;
  ProductsViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationManager.navigationWithSlide(
            context, ProductDetails(product: widget.product));
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.44,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.liteBlue, width: 1.5),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 101,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CachedNetworkImage(
                      imageUrl: widget.product.imageCover!,
                      placeholder: (_, __) => const LoadingWidget(),
                      errorWidget: (_, __, ___) => const Icon(Icons.error),
                      fit: BoxFit.cover,
                      width: MediaQuery.sizeOf(context).width,
                    ),
                    BlocListener<WishlistViewModel, WishlistState>(
                      listener: (_, state) {
                        switch (state) {
                          case WishlistLoading():
                            isLoadingToWishlist = true;
                          case WishlistError():
                            isLoadingToWishlist = false;
                          case WishlistSuccess():
                            isLoadingToWishlist = false;
                          default:
                        }
                      },
                      bloc: widget.wishlistViewModel,
                      child: GestureDetector(
                        onTap: () {
                          if (widget.isInWishlist) {
                            widget.wishlistViewModel
                                .removeFromWishlist(widget.product);
                          } else {
                            widget.wishlistViewModel
                                .addToWishlist(widget.product);
                          }
                        },
                        child: widget.isInWishlist
                            ? Image.asset(
                                AppAssets.inWishlistIcon,
                              )
                            : Image.asset(
                                AppAssets.notInWishlistIcon,
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 100,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.product.title ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 10.sp),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Review (${widget.product.ratingsAverage ?? 0})",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 8.sp),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Image.asset(
                              AppAssets.star,
                              width: 10,
                              height: 10,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "EGP ${numbersFormat(widget.product.price ?? 0)}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 8.sp),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 23.w,
                              height: 21.h,
                              child: BlocListener<ProductsViewModel, BaseState>(
                                listener: (context, state) {
                                  if (state is BaseLoadingState) {
                                    isLoadingToCart = true;
                                  } else if (state is BaseSuccessState) {
                                    isLoadingToCart = false;
                                  } else if (state is BaseErrorState) {
                                    isLoadingToCart = false;
                                  }
                                },
                                bloc: viewModel,
                                child: FloatingActionButton(
                                  mini: true,
                                  heroTag: widget.heroTag,
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none),
                                  onPressed: () async {
                                    if (widget.isInCart) {
                                      viewModel.loading();
                                      await widget.cartViewModel
                                          .removeFromCart(widget.product.id!);
                                      viewModel.hideLoading();
                                    } else {
                                      viewModel.loading();
                                      await widget.cartViewModel
                                          .addToCart(widget.product.id!);
                                      viewModel.hideLoading();
                                      showToast(
                                          message:
                                              "${widget.product.title} has been successfully added to your cart!",
                                          textColor: AppColors.primary,
                                          color: AppColors.fadedWhite);
                                    }
                                  },
                                  backgroundColor: AppColors.primary,
                                  child: isLoadingToCart
                                      ? Container(
                                          padding: const EdgeInsets.all(6),
                                          child: const LoadingWidget(
                                            color: AppColors.white,
                                          ))
                                      : Icon(
                                          widget.isInCart
                                              ? Icons.remove
                                              : Icons.add,
                                          color: AppColors.white,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
