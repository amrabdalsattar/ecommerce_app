import 'package:ecommerce_app/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyCartImage extends StatelessWidget {
  final String screenTitle;
  const EmptyCartImage({super.key, required this.screenTitle});

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
          "Your $screenTitle is empty",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Text(
            "Looks like you have not added anything to your $screenTitle. Go ahead & explore our products.",
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
