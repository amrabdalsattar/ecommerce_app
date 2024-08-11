import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTabWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  const CategoryTabWidget({super.key, required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSelected ? AppColors.white : AppColors.liteGrey,
      child: RotatedBox(
          quarterTurns: 3,
          child: Container(
              height: 70.h,
              width: 130.w,
              margin: EdgeInsets.only(left: 5.h),
              child: Center(
                  child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )))),
    );
  }
}
