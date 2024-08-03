import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/data/models/responses/products_responses/products_response.dart';
import 'package:ecommerce_app/domain/di/di.dart';
import 'package:ecommerce_app/presentation/shared_components/loading_widget.dart';
import 'package:ecommerce_app/presentation/tabs/home_tab/home_tab_components/products/product_details.dart';
import 'package:ecommerce_app/presentation/view_model/cart_view_model.dart';
import 'package:ecommerce_app/presentation/view_model/product_view_models/products_view_model.dart';
import 'package:ecommerce_app/presentation/view_model/states/base_states.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/dialog_utils.dart';
import 'package:ecommerce_app/utils/ui_logic_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_assets.dart';

class ProductWidget extends StatefulWidget {
  final ProductDM product;
  final bool isInCart;
  final CartViewModel cartViewModel;
  final String heroTag;

  const ProductWidget(
      {super.key,
      required this.product,
      required this.isInCart,
      required this.cartViewModel,
      required this.heroTag});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isLoadingToCart = false;
  ProductsViewModel viewModel = getIt();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetails.routeName,
            arguments: widget.product);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 7.w),
        width: MediaQuery.sizeOf(context).width * 0.44,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.liteBlue, width: 1.5),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 7,
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
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Image.asset(
                        AppAssets.wishlistIcon,
                        color: AppColors.primary,
                        height: 15.h,
                        width: 15.w,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.product.title ?? "",
                      style: Theme.of(context).textTheme.bodySmall,
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
                                  .copyWith(fontSize: 10.5.sp),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Image.asset(AppAssets.star)
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "EGP ${numbersFormat(widget.product.price ?? 0)}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 11.sp),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 34.w,
                              height: 31.h,
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
                                          padding: const EdgeInsets.all(10),
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
