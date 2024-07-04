import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w),
      margin: EdgeInsets.only(
        left: 10.w,
      ),
      height: 40.h,
      width: MediaQuery.sizeOf(context).width * .8,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primary),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: AppColors.primary,
            size: 28,
          ),
          Text(
            "What do you search for?",
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
