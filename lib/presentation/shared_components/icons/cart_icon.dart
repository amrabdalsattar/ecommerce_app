import 'package:ecommerce_app/presentation/screens/main_screen/main_screen_components/cart/cart_screen.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_assets.dart';

class CartIcon extends StatelessWidget {
  final double size;

  const CartIcon({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 20.w),
        child: InkWell(
            onTap: () {
              NavigationManager.navigationWithSlide(context, const CartScreen());
            },
            splashColor: AppColors.liteGrey,
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AppAssets.cartIcon,
              height: size.h,
            )));
  }
}
