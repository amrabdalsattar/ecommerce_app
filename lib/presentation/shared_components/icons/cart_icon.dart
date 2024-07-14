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
        child: Image.asset(AppAssets.cartIcon, height: size.h,));
  }
}
