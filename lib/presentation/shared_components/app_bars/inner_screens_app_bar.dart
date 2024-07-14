import 'package:ecommerce_app/presentation/shared_components/icons/cart_icon.dart';
import 'package:ecommerce_app/presentation/shared_components/icons/search_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InnerScreensAppBar extends StatelessWidget {
  const InnerScreensAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Product Details",
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        const SearchIcon(size: 20,),
        SizedBox(width: 20.w,),
        const CartIcon(size: 20),
      ],
    );
  }
}
