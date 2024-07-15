import 'package:ecommerce_app/presentation/shared_components/icons/cart_icon.dart';
import 'package:ecommerce_app/presentation/shared_components/icons/search_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InnerScreensAppBar extends StatelessWidget {
  final bool isForCartScreen;
  final String title;

  const InnerScreensAppBar(
      {super.key, this.isForCartScreen = false, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.bold, fontSize: 16.sp),
      ),
      centerTitle: true,
      actions: [
        const SearchIcon(
          size: 20,
        ),
        SizedBox(
          width: 20.w,
        ),
        isForCartScreen ? Container() : const CartIcon(size: 20),
      ],
    );
  }
}
