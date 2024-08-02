import 'package:ecommerce_app/presentation/screens/main_screen/main_screen_components/cart/cart_components/empty_cart_image.dart';
import 'package:ecommerce_app/presentation/screens/main_screen/main_screen_components/cart/cart_item.dart';
import 'package:ecommerce_app/presentation/shared_components/buttons/methods_button.dart';
import 'package:ecommerce_app/presentation/view_model/cart_view_model.dart';
import 'package:ecommerce_app/presentation/view_model/product_view_models/product_details_view_model.dart';
import 'package:ecommerce_app/utils/ui_logic_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/di/di.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../shared_components/app_bars/inner_screens_app_bar.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "cartScreen";

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartViewModel cartViewModel = BlocProvider.of(context);
    ProductDetailsViewModel productDetailsViewModel =
        getIt<ProductDetailsViewModel>();
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: const InnerScreensAppBar(
            isForCartScreen: true,
            title: "Cart",
          ),
        ),
        body: BlocBuilder(
          bloc: productDetailsViewModel,
          builder: (_, state) => Container(
            child: cartViewModel.cartDM == null ||
                    cartViewModel.cartDM!.products!.isEmpty
                ? const EmptyCartImage()
                : Column(
                    children: [
                      Expanded(
                        flex: 9,
                        child: ListView.builder(
                          itemCount:
                              cartViewModel.cartDM?.products?.length ?? 0,
                          itemBuilder: (context, index) => CartItem(
                            cartProduct: cartViewModel.cartDM!.products![index],
                            cartViewModel: cartViewModel,
                            productDetailsViewModel: productDetailsViewModel,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Total price",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: AppColors.fadeBlue,
                                              fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "EGP ${numbersFormat(cartViewModel.cartDM!.totalCartPrice!)}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                const MethodsButton(
                                  body: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Check Out",
                                        style:
                                            TextStyle(color: AppColors.white),
                                      ),
                                      Icon(
                                        Icons.arrow_right_alt,
                                        color: AppColors.white,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
          ),
        ));
  }
}
