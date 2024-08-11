import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class TextShimmerLoading extends StatelessWidget {
  final double width;
  const TextShimmerLoading({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: width.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.black,
      ),
    );
  }
}
