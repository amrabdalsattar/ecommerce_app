import 'package:ecommerce_app/data/models/responses/products_responses/products_response.dart';
import 'package:ecommerce_app/presentation/shared_components/app_bars/inner_screens_app_bar.dart';
import 'package:ecommerce_app/presentation/shared_components/buttons/methods_button.dart';
import 'package:ecommerce_app/presentation/shared_components/increment_and_decrement_button.dart';
import 'package:ecommerce_app/presentation/shared_components/slider_widget.dart';
import 'package:ecommerce_app/presentation/view_model/cart_view_model.dart';
import 'package:ecommerce_app/presentation/view_model/product_view_models/product_details_view_model.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/dialog_utils.dart';
import 'package:ecommerce_app/utils/ui_logic_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../../domain/di/di.dart';
import '../../../../../utils/app_assets.dart';

class ProductDetails extends StatelessWidget {
  static const String routeName = "productDetails";

  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsViewModel viewModel = getIt<ProductDetailsViewModel>();
    var cartViewModel = context.read<CartViewModel>();
    var product = ModalRoute.of(context)!.settings.arguments as ProductDM;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: const InnerScreensAppBar(
          title: "Product Details",
        ),
      ),
      body: BlocBuilder<ProductDetailsViewModel, dynamic>(
        bloc: viewModel,
        builder: (BuildContext context, state) => Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 9,
                child: ListView(
                  children: [
                    SliderWidget(
                      images: product.images!,
                      viewModel: viewModel,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 7,
                            child: Text(
                              product.title!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            )),
                        Expanded(
                            flex: 3,
                            child: Text(
                              "EGP ${numbersFormat(product.price!)}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.liteBlue),
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "${numbersFormat(product.sold!)} Sold",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(AppAssets.star),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                                "${product.ratingsAverage!} (${product.ratingsQuantity})"),
                          ],
                        ),
                        Visibility(
                            visible: cartViewModel.isInCart(product) == null,
                            child: IncrementAndDecrementButton(
                              viewModel: viewModel,
                              cartViewModel: cartViewModel,
                              product: product,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    ReadMoreText("${product.description!}  ",
                        trimMode: TrimMode.Line,
                        colorClickableText: AppColors.grey,
                        trimCollapsedText: "Show more",
                        trimExpandedText: "Show less",
                        moreStyle: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold),
                        lessStyle: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold),
                        trimLines: 3,
                        style: TextStyle(
                            color: AppColors.fadeBlue, fontSize: 13.sp)),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder(
                      bloc: cartViewModel,
                      builder: (context, state) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total price",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: AppColors.fadeBlue,
                                    fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "EGP ${numbersFormat(product.price! * (cartViewModel.isInCart(product)?.count ?? 0))}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                        child: cartViewModel.isInCart(product) != null
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: IncrementAndDecrementButton(
                                  viewModel: viewModel,
                                  cartViewModel: cartViewModel,
                                  product: product,
                                ))
                            : MethodsButton(
                                onPressed: () async {
                                  showLoading(context);
                                  await cartViewModel.addToCart(product.id!);
                                  Navigator.pop(context);
                                },
                                body: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.add_shopping_cart,
                                      color: AppColors.white,
                                    ),
                                    Text(
                                      "Add to cart",
                                      style: TextStyle(color: AppColors.white),
                                    )
                                  ],
                                ),
                              ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
