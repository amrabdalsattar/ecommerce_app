import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/presentation/shared_components/increment_and_decrement_button.dart';
import 'package:ecommerce_app/presentation/view_model/cart_view_model.dart';
import 'package:ecommerce_app/presentation/view_model/product_view_models/product_details_view_model.dart';
import 'package:ecommerce_app/utils/ui_logic_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../data/models/responses/products_responses/cart_response.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../shared_components/loading_widget.dart';

class CartItem extends StatelessWidget {
  final CartViewModel cartViewModel;
  final CartProduct cartProduct;
  final ProductDetailsViewModel productDetailsViewModel;

  const CartItem(
      {super.key,
      required this.cartProduct,
      required this.cartViewModel,
      required this.productDetailsViewModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.12,
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.liteBlue),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: cartProduct.product!.imageCover!,
                      placeholder: (_, __) => const LoadingWidget(),
                      errorWidget: (_, __, ___) => const Icon(Icons.error),
                      fit: BoxFit.cover,
                      width: MediaQuery.sizeOf(context).width,
                    ),
                  )),
              Expanded(
                flex: 7,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 30.w),
                              child: Text(
                                cartProduct.product!.title!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            Text(
                              cartProduct.product!.category!.name!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: AppColors.litePrimary),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "EGP ${numbersFormat(cartProduct.price! * (cartViewModel.isInCart(cartProduct.product!)?.count ?? 0))}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                IncrementAndDecrementButton(
                                    viewModel: productDetailsViewModel,
                                    cartViewModel: cartViewModel,
                                    product: cartProduct.product!)
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.all(5),
            child: IconButton(
                onPressed: () {
                  productDetailsViewModel.decreaseNumberOfItems(
                      cartViewModel, cartProduct.product!.id!);
                },
                icon: const Icon(
                  CupertinoIcons.delete,
                  size: 20,
                  color: AppColors.primary,
                )))
      ],
    );
  }
}
