import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class HomeTitle extends StatelessWidget {
  final String title;
  const HomeTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineLarge!
          .copyWith(color: AppColors.primary, fontSize: 16.sp),
    );
  }
}
