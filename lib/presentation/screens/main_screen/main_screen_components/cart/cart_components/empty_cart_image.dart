import 'package:ecommerce_app/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyCartImage extends StatelessWidget {
  const EmptyCartImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            AppAssets.emptyCartImage,
            height: 150,
            width: 150,
          ),
        ),
        Text(
          "Your cart is empty",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Text(
            "Looks like you have not added anything to your cart. Go ahead & explore our products.",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
